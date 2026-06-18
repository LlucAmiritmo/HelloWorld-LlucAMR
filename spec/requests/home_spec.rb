require "rails_helper"

RSpec.describe "Home pages", type: :request do
  it "displays the home index text on the root page" do
    get root_path

    expect(response).to have_http_status(:success)
    expect(response.body).to include("Home#index")
    expect(response.body).to include("Find me in app/views/home/index.html.erb")
  end

  it "displays the same page on /lluc/test" do
    get "/lluc/test"

    expect(response).to have_http_status(:success)
    expect(response.body).to include("Home#index")
    expect(response.body).to include("Find me in app/views/home/index.html.erb")
  end

  it "displays the id parameter on /lluc/ambid/:id" do
    get "/lluc/ambid/123"

    expect(response).to have_http_status(:success)
    expect(response.body).to include("Home#index")
    expect(response.body).to include("params[:id]=123")
  end
end