require "rails_helper"

describe SearchService do
  context "#zip" do
    it "returns stores within 25 miles of given zip" do
      VCR.use_cassette("zip_search") do
        zip = "80202"
        stores = SearchService.new.get_stores(zip)
        byebug

      end
    end
  end
end
