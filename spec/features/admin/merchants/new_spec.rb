require "rails_helper"

RSpec.describe "admin merchant create", type: :feature do
  load_test_data

  describe "as an admin, after I've clicked new merchant" do
    describe "I am taken to a form" do
      it "creates a new merchant and takes me to the admin merchants index" do
        visit new_admin_merchant_path

        expect(Merchant.last).to eq(merchant_7)

        fill_in("Name", with: "Created Merchant")
        click_button("Submit")

        expect(current_path).to eq(admin_merchants_path)

        expect(Merchant.last.name).to eq("Created Merchant")
        expect(Merchant.last.status).to eq("disabled")
      end
    end
  end
end