require 'rails_helper'

RSpec.describe "Reurls", type: :request do
  describe "POST #newurl" do

    it "generate new url if the given url is eligible" do
        post "/newurl", :params => { :originUrl => "google.com" }
        expect(assigns(:newurl)).to eq("localhost/00000a")
    end

    it "prevent SQL injection" do

    end

    it "only allow domains in white list" do

    end
  end
end
