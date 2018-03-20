class CommonMailer < ApplicationMailer
  def ping(email)
    mail(to: email, subject: "[Nexvs] Ping")
  end
end
