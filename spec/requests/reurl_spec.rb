require 'rails_helper'

RSpec.describe "Reurls", type: :request do
  describe "POST #newurl" do

    it "generate new url if the given url is eligible" do
        post "/newurl", :params => { :originUrl => "https://www.google.com" }
        expect(assigns(:reurl)).to eq("http://localhost:3000/00000a")
    end

    it "prevent SQL injection" do

    end

    it "only allow urls' response status code is 200" do
      post "/newurl", :params => { :originUrl => "https://google.com" }
      expect(flash[:notice]).to eq "invalid url"
    end

    it "only accept urls begin with http/https" do
      post "/newurl", :params => { :originUrl => "www.google.com" }
      expect(flash[:notice]).to eq "url should start with http or https"
    end

  end
  describe "redirect url" do
    it "redirect to url" do
      get "/00000o"
      expect(response).to redirect_to("https://www.google.com")
    end
    it "alert to non-existent url"
  end
end
