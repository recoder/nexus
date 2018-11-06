require 'digest/sha1'

# The Tiny::Url class represents a URL shortened into a slug
class Tiny::Url < ApplicationRecord
  belongs_to :user

  validates :slug, presence: true
  validates :url, presence: true

  after_initialize :init

  def banned?
    state == 'B'
  end

  def init
    if self.slug.blank? && self.url.present?
      self.slug = self.class.compute_slug(self.url, 5)
    end
  end

  def hit
  end

  def self.compute_slug(url, len = 5)
    seed = Digest::SHA1.hexdigest(url).to_i(16)
    pick_slug(seed, len)
  end

  def self.pick_slug(value, len = 5)
    bj = Bijective.new()

    loop do
      slug = bj.encode_modulo(value, len)
      return slug unless find_by_slug(slug)
      value = value + 1
    end
  end
end
