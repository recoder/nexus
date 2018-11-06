# The system User model

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tiny_urls, class_name: 'Tiny::Url'

  def admin?
    access == 'A'
  end

  def resident?
    access == 'R'
  end

  def ghost?
    access == 'X'
  end
end
