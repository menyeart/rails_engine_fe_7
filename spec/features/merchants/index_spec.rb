require "rails_helper"

RSpec.describe "Merchants Index Page" do
  describe "As a user" do
    it "when I visit '/merchants' I should see a list of merchants by name and when I click the merchant's name I should be on page '/merchants/:id and I should see a list of items that merchant sells"  do
      visit "/merchants"
      save_and_open_page
      expect(page).to have_link("Schroeder-Jerde")
      expect(page).to have_link("Klein, Rempel and Jones")
      expect(page).to have_link("Willms and Sons")

      click_link("Schroeder-Jerde")
      
      expect(current_path).to eq("/merchants/1")
      expect(page).to have_content("Item Name: Item Nemo Facere")
      expect(page).to have_content("Item Description: Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")
      expect(page).to have_content("Item Unit Price: 42.91")
    end
  end
end