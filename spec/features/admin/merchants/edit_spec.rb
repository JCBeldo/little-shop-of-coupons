require "rails_helper"

RSpec.describe "admin merchant update", type: :feature do
  load_test_data

  describe "as an admin" do
    describe "when I visit admin merchant's show page" do
      it "keeps the merchant's info populated and then updates that merchant with information inputted" do
        disabled_merchant = Merchant.create!(name: "Disabled Merchant", status: 0)

        visit admin_merchant_path(disabled_merchant)

        expect(page).to have_content("#{disabled_merchant.name}")
        expect(disabled_merchant.name).to eq("Disabled Merchant")

        click_link("Update Merchant")
        expect(current_path).to eq(edit_admin_merchant_path(disabled_merchant))

        expect(page.has_field?("Name", with: disabled_merchant.name)).to eq(true)

        fill_in("Name", with: "Updated Disabled Merchant")
        click_button("Submit")
        expect(current_path).to eq(admin_merchant_path(disabled_merchant))


        disabled_merchant = Merchant.find(disabled_merchant.id)
        expect(disabled_merchant.name).to eq("Updated Disabled Merchant")
        expect(page).to have_content("Merchant Information Updated")
      end

      it "keeps the merchant's info populated and then updates that merchant with information inputted" do
        enabled_merchant = Merchant.create!(name: "Enabled Merchant", status: 1)

        visit admin_merchant_path(enabled_merchant)

        expect(page).to have_content("#{enabled_merchant.name}")
        expect(enabled_merchant.name).to eq("Enabled Merchant")
        expect(enabled_merchant.status).to eq("enabled")

        click_link("Update Merchant")
        expect(current_path).to eq(edit_admin_merchant_path(enabled_merchant))

        expect(page.has_field?("Name", with: enabled_merchant.name)).to eq(true)

        fill_in("Name", with: "Updated Enabled Merchant")
        click_button("Submit")
        expect(current_path).to eq(admin_merchant_path(enabled_merchant))

        enabled_merchant = Merchant.find(enabled_merchant.id)

        expect(enabled_merchant.name).to eq("Updated Enabled Merchant")
        expect(enabled_merchant.status).to eq("enabled")
        expect(page).to have_content("Merchant Information Updated")
      end
    end
  end
end