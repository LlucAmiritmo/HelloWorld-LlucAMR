# require "rails_helper"

# RSpec.describe "Home page", type: :system do
#   it "shows the home index text on the root page" do
#     visit root_path

#     #sleep 5

#     expect(page).to have_text("Home#index")
#     expect(page).to have_text("Find me in app/views/home/index.html.erb")
#   end

#   it "shows the same page on lluc test" do
#     visit "/lluc/test"

#     #sleep 5

#     expect(page).to have_text("Home#index")
#     expect(page).to have_text("Find me in app/views/home/index.html.erb")
#   end

#   it "shows the id parameter on lluc ambid page" do
#     visit "/lluc/ambid/123"

#     #sleep 5

#     expect(page).to have_text("Home#index")
#     expect(page).to have_text("params[:id]=123")
#   end
# end