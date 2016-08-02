require "rails_helper"

RSpec.feature "user can search for stores by zip code" do
  describe "they enter a valid zip code" do
    scenario "they see a list of 15 stores within a 25 mile radius" do
      visit "/"

      fill_in "zip", with: "80202"
      click_on "Search"

      expect(current_path).to eq "/search"
      expect(page).to have_content "17 Total Stores"
      within ".results" do
        expect(page).to have_selector('.store', count: 15)
      end

      within ".store" do
        expect(page).to have_content "Name"
        expect(page).to have_content "City"
        expect(page).to have_content "Distance"
        expect(page).to have_content "Phone Number"
        expect(page).to have_content "Store Type"
      end
    end
  end
end
