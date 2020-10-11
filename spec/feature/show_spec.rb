require 'rails_helper'

describe "As a visitor" do 
  describe "when I visit /shelters/:id" do
    include Capybara::DSL
    it "I see the shelter with that id including the shelter's:
          - name
          - address
          - city
          - state
          - zip" do
      
      shelter = Shelter.create(name: "Sloans", address: "123 Main St", city: "Denver", state: "CO", zip: "80221")

      visit "/shelters/#{shelter.id}"

      expect(page).to have_content(shelter.name)
      expect(page).to have_content(shelter.address)
      expect(page).to have_content(shelter.city)
      expect(page).to have_content(shelter.state)
      expect(page).to have_content(shelter.zip)
    end  
  end
end 