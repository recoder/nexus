require 'rails_helper'

RSpec.describe "front/index", type: :view do
  it "shows something" do
    render
    expect(rendered).to match /ReCoder/
  end
end
