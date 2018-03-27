FactoryGirl.define do
  factory :user do
    nickname "Test User"
    email "test@example.com"
    language "en"
    password "please123"
  end

  factory :admin_user, class: User do
    nickname "Admin User"
    email "admin@example.com"
    language "en"
    password "admin123"
    access 'A'
  end

  factory :resident_user, class: User do
    nickname "Resident User"
    email "resident@example.com"
    language "ru"
    password "123456"
    access 'R'
  end
end
