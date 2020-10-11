require 'rails_helper'

describe "As a visitor" do 
  describe "when I visit /shelters" do
    include Capybara::DSL
    it "I see a link to create a new shelter" do

      visit '/shelters'

      shelter = Shelter.create(name: "Sloans", address: "123 Main St", city: "Denver", state: "CO", zip: "git statu")

      expect(page).to have_link("New Shelter")
      click_link("New Shelter")
      expect(current_path).to eq('/shelters/new')
      fill_in 'name', with: "#{shelter.name}"
      fill_in 'address', with: "#{shelter.address}"
      fill_in 'city', with: "#{shelter.city}"
      fill_in 'state', with: "#{shelter.state}"
      fill_in 'zip', with: "#{shelter.zip}"
      click_on("Create Shelter")
      expect(current_path).to eq('/shelters')
      expect(page).to have_content(shelter.name)
      expect(page).to have_content(shelter.address)
      expect(page).to have_content(shelter.city)
      expect(page).to have_content(shelter.state)
      expect(page).to have_content(shelter.zip)
    end  
  end
end