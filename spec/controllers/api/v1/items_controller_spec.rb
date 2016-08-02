require "rails_helper"

RSpec.describe Api::V1::ItemsController do
  fixtures :items
  describe "GET index" do
    it "can get all items" do
      get :index

      expect(response.status).to eq 200

      items = JSON.parse(response.body)
      expect(items.count).to eq 1
    end
  end
end
