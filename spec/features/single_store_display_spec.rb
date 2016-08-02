require "rails_helper"

RSpec.feature "user can see single store by id" do
  describe "they click on store name" do
    scenario "they see individual store info" do
      VCR.use_cassette("id_feature") do
        visit "/"

        fill_in "zip", with: "80202"
        click_on "Search"
        click_on "Best Buy - Littleton"

        expect(current_path).to eq "/stores/210"

        expect(page).to have_content "Best Buy - Littleton"
      end
    end
  end
end
