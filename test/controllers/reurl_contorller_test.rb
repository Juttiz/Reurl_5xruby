require "../test_helper.rb"
RSpec.describe ReUrl do
    describe "get new url" do

        it "generate new url if the given url is eligible", :type => :controller do

            # reurl = Reurl.create(originUrl: "google.com")
            expect(reurl.originUrl).to eq("google.com")
        end

        it "prevent SQL injection" do

        end

        it "only allow domains in white list" do

        end
    end

    describe "redirect url" do
        it "redirect to url"
        it "alert to non-existent url"
    end
end