require "rails_helper"

RSpec.describe "TinyURLs", type: :request do
  context "for residents" do
    before :each do
      login_as create(:resident_user)
    end

    describe "GET /-foo" do
      it "redirects" do
        create(:tiny_url)
        get '/-foo'
        expect(response).to redirect_to "http://example.com/foo"
      end
    end

    describe "GET /tiny/" do
      it "shows the app" do
        get '/tiny/'
        expect(response).to have_http_status(:ok)
      end
    end

    describe "GET /tiny/urls" do
      it "shows the list" do
        create(:tiny_url)
        get '/tiny/urls'
        expect(response).to have_http_status(:ok)
        # TODO: make sure you don't see other's URLs
      end
    end

    describe "POST /tiny/urls" do
      it "creates a new URL" do
        post '/tiny/urls', params: { tiny_url: { url: 'http://example.com/bar', slug: 'baz' } }
        # expect(response).to redirect_to(assigns(:tiny_url))
        # follow_redirect!
        # expect(response).to render_template(:show)
        # expect count to increase
      end
    end

    #    describe "DELETE /tiny/urls/{id}" do
    #      it "fails" do
    #        create(:tiny_url)
    #        delete '/tiny/urls/13'
    #        expect(response).to have_http_status(403)
    #      end
    #    end

    describe "GET /tiny/urls/13" do
      it "shows the info" do
        create(:tiny_url)
        get '/tiny/urls/13'
        expect(response).to have_http_status(:ok)
      end
    end

    # TODO: GET preview
  end

  context "anonymously" do
    before :each do
      login_as nil
    end

    describe "GET /-foo" do
      it "redirects" do
        create(:tiny_url)
        get '/-foo'
        expect(response).to redirect_to "http://example.com/foo"
      end
    end

    describe "GET /tiny/" do
      it "requires to sign in" do
        get '/tiny/'
        expect(response).to have_http_status(302)
      end
    end

    describe "GET /tiny/urls" do
      it "requires to sign in" do
        get '/tiny/urls'
        expect(response).to have_http_status(302)
      end
    end

    describe "POST /tiny/urls" do
      it "requires to sign in" do
        post '/tiny/urls'
        expect(response).to have_http_status(302)
      end
    end

    describe "GET /tiny/urls/1" do
      it "requires to sign in" do
        post '/tiny/urls'
        expect(response).to have_http_status(302)
      end
    end

    # TODO: GET preview
  end
end
