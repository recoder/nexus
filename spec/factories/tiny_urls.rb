FactoryGirl.define do
  factory :tiny_url, class: Tiny::Url do
    association :user, email: 'urler@example.com'
    id { 13 }
    url { 'http://example.com/foo' }
    slug { 'foo' }
  end
end
