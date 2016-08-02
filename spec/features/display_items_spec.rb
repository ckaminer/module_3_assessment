require "rails_helper"

RSpec.feature "Display all items test" do
  context "successful request" do
    scenario "page displays all items" do
      visit "/"
      expect(page.status_code).to eq 200

      within "h1" do
        expect(page).to have_content "Items"
      end
    end
  end
end
