require 'digest/sha2'

class ApplicationMailer < ActionMailer::Base
  default "Message-ID" => "#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@#{ENV['DOMAIN_NAME']}"
  default from: ENV.fetch("EMAIL_FROM") { 'nexvs@example.com' }

  layout 'mailer'
end
