require "rails_helper"

RSpec.feature "user can search for stores by zip code" do
  describe "they enter a valid zip code" do
    scenario "they see a list of 15 stores within a 25 mile radius" do
      visit "/"

      fill_in "search", with: "80202"

      expect(current_path).to eq "/search"
      expect(page).to have_content "17 Total Stores"
      within ".results" do
        expect(page).to have_selector('.store', count: 15)
      end
    end
  end
end
