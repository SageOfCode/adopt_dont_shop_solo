require 'rails_helper'

describe "As a visitor" do 
  describe "when I visit /shelters" do
    include Capybara::DSL
    it "I see the name of each shelter in the system" do

      visit '/shelters'

    end  
  end
  describe "when I visit /shelters/:id" do
    include Capybara::DSL
    it "I see the shelter with that id including the shelter's:
          - name
          - address
          - city
          - state
          - zip" do

      visit '/shelters/:id'

      expect(page).to have_content("name")
      expect(page).to have_content("address")
      expect(page).to have_content("city")
      expect(page).to have_content("state")
      expect(page).to have_content("zip")
    end  
  end
end