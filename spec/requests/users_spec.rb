require "rails_helper"

RSpec.describe "Users", type: :request do
  context "authorized as admin" do
    before :each do
      login_as create(:admin_user)
    end

    describe "GET /users" do
      it "shows all users" do
        get '/users'
        expect(response).to have_http_status(:success)
      end
    end
  end

  context "authorized as resident" do
    before :each do
      login_as create(:resident_user)
    end

    describe "GET /users" do
      it "shows some users" do
        get '/users'
        expect(response).to have_http_status(401)
      end
    end
  end

  context "anonymous" do
    before :each do
      login_as nil
    end

    describe "GET /users" do
      it "requires to sign in" do
        get '/users'
        expect(response).to have_http_status(302)
      end
    end
  end
end
