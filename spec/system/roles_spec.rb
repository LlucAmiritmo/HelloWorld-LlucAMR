require "rails_helper"

RSpec.describe "Roles", type: :system do
  it "allows the user to create a role" do
    visit roles_path

    click_link "New role"

    fill_in "Code", with: "ADMIN"
    fill_in "Description", with: "Administrator"
    check "Admin"

    click_button "Create Role"

    #expect(page).to have_text("Role was created successfully.")
    expect(page).to have_text("ADMIN")
    expect(page).to have_text("Administrator")
    expect(page).to have_text("true")
  end

  it "shows validation errors when creating an invalid role" do
    visit roles_path

    click_link "New role"

    fill_in "Code", with: ""
    fill_in "Description", with: ""

    click_button "Create Role"

    expect(page).to have_text("prevented this role from being saved")
    expect(page).to have_text("Code can't be blank")
    expect(page).to have_text("Description can't be blank")
  end

  it "allows the user to edit a role" do
    FactoryBot.create(:role, code: "USER", description: "Standard user", admin: false, user: true)

    visit roles_path

    click_link "Edit"

    fill_in "Code", with: "MANAGER"
    fill_in "Description", with: "Manager role"
    check "Admin"

    click_button "Update Role"

    #expect(page).to have_text("Role was updated successfully.")
    expect(page).to have_text("MANAGER")
    expect(page).to have_text("Manager role")
  end

  it "allows the user to delete a role" do
    FactoryBot.create(:role, code: "TEMP", description: "Temporary role")

    visit roles_path

    expect(page).to have_text("TEMP")

    accept_confirm "Are you sure?" do
      click_button "Delete"
    end

    #expect(page).to have_text("Role was deleted successfully.")
    expect(page).not_to have_text("TEMP")
  end
end