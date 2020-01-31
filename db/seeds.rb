# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

unless Rails.application.secrets.admin_email.blank?
  username = Rails.application.secrets.admin_email
  password = Rails.application.secrets.admin_password || "admin!!!"

  User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
    user.nickname = 'admin'
    user.email = username
    user.password = password
    user.password_confirmation = password
    user.access = 'A'
    if Devise.mappings[:user].confirmable?
      user.confirm
    end
    puts "Created #{user.nickname} user for #{user.email} with password #{user.password}"
  end
end

# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
