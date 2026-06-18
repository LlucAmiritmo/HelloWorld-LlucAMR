require "rails_helper"

RSpec.describe "Users", type: :system do
  it "allows the user to create a user" do
    FactoryBot.create(:role, code: "ADMIN", description: "Administrator", admin: true, user: false)

    visit users_path

    click_link "New user"

    fill_in "Name", with: "Lluc"
    fill_in "Login", with: "lluc"
    select "ADMIN", from: "Role"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"

    click_button "Create User"

    # expect(page).to have_text("User was created successfully.")
    expect(page).to have_text("Lluc")
    expect(page).to have_text("lluc")
    expect(page).to have_text("ADMIN")
  end
end