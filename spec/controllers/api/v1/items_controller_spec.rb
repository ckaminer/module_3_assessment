require "rails_helper"

RSpec.describe Api::V1::ItemsController do
  fixtures :items
  describe "GET index" do
    it "can get all items" do
      get :index

      expect(response.status).to eq 200

      items = JSON.parse(response.body)
      expect(items.count).to eq 2
      expect(items.first["name"]).to eq "Second Item"
      expect(items.first["description"]).to eq "Second Description"
      expect(items.first["image_url"]).to eq "Second image url"
      expect(items.first["created_at"]).to eq nil
      expect(items.first["updated_at"]).to eq nil
    end
  end

  describe "GET show" do
    it "can get single specified items" do
      item = items(:one)
      get :show, id: item.id

      expect(response.status).to eq 200

      item = JSON.parse(response.body)
      expect(item["name"]).to eq "First Item"
      expect(item["description"]).to eq "First Description"
      expect(item["image_url"]).to eq "First image url"
      expect(item["created_at"]).to eq nil
      expect(item["updated_at"]).to eq nil
    end
  end

  describe "DELETE destroy" do
    it "can delete single specified items" do
      item = items(:one)
      delete :destroy, id: item.id

      expect(response.status).to eq 204
    end
  end

  describe "POST create" do
    it "can create a new item" do
      name = "New Name"
      description = "New Description"
      image_url = "New Image"
      post :create, name: name, description: description, image_url: image_url

      expect(response.status).to eq 201

      item = JSON.parse(response.body)

      expect(item["name"]).to eq name
      expect(item["description"]).to eq description
      expect(item["image_url"]).to eq image_url
      expect(item["created_at"]).to eq nil
      expect(item["updated_at"]).to eq nil
    end
  end
end
