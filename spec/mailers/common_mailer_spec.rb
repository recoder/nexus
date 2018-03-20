require "rails_helper"

RSpec.describe CommonMailer, type: :mailer do
  describe "ping" do
    let(:mail) { CommonMailer.ping('to@example.com') }

    it "renders the headers" do
      expect(mail.subject).to eq("[Nexvs] Ping")
      expect(mail.to).to eq(['to@example.com'])
      expect(mail.from).to eq(["nexvs@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Ping")
    end
  end
end
