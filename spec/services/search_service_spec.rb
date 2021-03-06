require "rails_helper"

describe SearchService do
  context "#zip" do
    it "returns stores within 25 miles of given zip" do
      VCR.use_cassette("zip_search") do
        zip = "80202"
        stores = SearchService.new.get_stores(zip)

        expect(stores["total"]).to eq 17
        expect(stores["stores"].first["longName"]).to eq "Best Buy Mobile - Cherry Creek Shopping Center"
        expect(stores["stores"].first["city"]).to eq "Denver"
        expect(stores["stores"].first["phone"]).to eq "303-270-9189"
        expect(stores["stores"].first["distance"]).to eq 3.25
        expect(stores["stores"].first["storeType"]).to eq "Mobile"
      end
    end
  end

  context "#id" do
    it "returns store for given id" do
      VCR.use_cassette("id_search") do
        id = "210"
        store = SearchService.new.find_store(id)

        expect(store["total"]).to eq 1
        expect(store["stores"].first["longName"]).to eq "Best Buy - Littleton"
        expect(store["stores"].first["address"]).to eq "5395 S Wadsworth Blvd"
        expect(store["stores"].first["city"]).to eq "Littleton"
        expect(store["stores"].first["region"]).to eq "CO"
        expect(store["stores"].first["postalCode"]).to eq "80123"
        expect(store["stores"].first["storeType"]).to eq "BigBox"
      end
    end
  end
end
