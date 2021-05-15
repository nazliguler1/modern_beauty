require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET landing page" do
    it "returns http success" do
      get :landing
      expect(response).to have_http_status(:success)
    end
  end

end
