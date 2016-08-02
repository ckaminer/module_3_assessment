require "rails_helper"

RSpec.describe Api::V1::ItemsController do
  fixtures :items
  describe "GET index" do
    it "can get all items" do
      get :index

      expect(response.status).to eq 200

      items = JSON.parse(response.body)
      expect(items.count).to eq 1
      expect(items.first["name"]).to eq "First Item"
      expect(items.first["description"]).to eq "First Description"
      expect(items.first["image_url"]).to eq "First image url"
      expect(items.first["created_at"]).to eq nil
      expect(items.first["updated_at"]).to eq nil
    end
  end
end
