require 'devise'

RSpec.configure do |config|
  Warden.test_mode!

  config.after do
    Warden.test_reset!
  end

  config.include Warden::Test::Helpers
end
