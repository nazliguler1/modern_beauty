require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  #@user = User.find_by(name: 'SUNY Tester', email: 'stester@binghamton.edu')

  before(:each) do
    @user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
    @auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
    session[:user_id] = @user.id
    @current_user = @user
  end
  
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }
  
  let(:valid_session) { {} }
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:id1) {'1'}
    it "returns http success" do
      get :show, :id=>id1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    let(:id1) {'1'}
    it "returns http success" do
      get :edit, :id=>id1
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "DELETE #destroy" do
    it "destroys the requested profile" do
      service = Service.create! valid_attributes
      expect {
        delete :destroy, {:id => service.to_param}, valid_session
      }.to change(Service, :count).by(-1)
    end
  end
  
end
