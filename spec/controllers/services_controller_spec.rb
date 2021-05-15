require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  #@user = User.find_by(name: 'SUNY Tester', email: 'stester@binghamton.edu')

  before(:each) do
    @user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
    @auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
    session[:user_id] = @user.id
    @current_user = @user
  end
  
  describe "#index" do
    
    it 'retrieves all of the services' do  
      get :index
      expect(assigns(:services)).to eq(Service.all)
    end
    
    it 'renders index template' do
      get :index
      expect(response).to render_template('index')
    end
    
  end

  describe "#show" do
    let(:id1) {'1'}
    let(:service) {instance_double('Service', name: 'Service1')}

    it 'renders show template' do
      allow(Service).to receive(:find).and_return(service)
      get :show, id: id1
      expect(response).to render_template('show')
    end
    
    it 'makes the movie available to the template' do
      allow(Service).to receive(:find).and_return(service)
      get :show, id: id1 
      expect(assigns(:service)).to eq(service)
    end
    
     it 'makes the service available to the template' do
      allow(Service).to receive(:find).and_return(service)
      get :show, id: id1 
      expect(assigns(:service)).to eq(service)
    end
    
  end

  describe "#new" do
    let(:id1) {'1'}
    let(:service) {instance_double('Service', name: 'Service1')}
    
    it 'creates an instance of the service model' do
      get :new
      expect(assigns[:service]).to be_instance_of(Service)
    end
    
    it 'selects the new template for rendering' do
      allow(Service).to receive(:find).and_return(service)
      get :new, id: id1
      expect(response).to render_template(:new)
    end

  end

  describe "#edit" do
    let(:id1) {'1'}
    let(:service) {instance_double('Service', name: 'Service1')}  
    
    it 'renders the edit template' do
      allow(Service).to receive(:find).and_return(service)
      get :edit, id: id1
      expect(response).to render_template('edit')
    end
    
  end
  
  describe "DELETE #destroy" do
    let(:id1) {'1'}
    let(:service) {instance_double('Service', name: 'Service1')}
 
    it 'retrieves the service' do
      expect(Service).to receive(:find).and_return(service)

      allow(service).to receive(:destroy)
      delete :destroy, :id => id1
    end

    it 'deletes the service' do
      allow(Service).to receive(:find).and_return(service)
      expect(service).to receive(:destroy)
      delete :destroy, :id => id1
    end
    
    it 'sets the flash message' do
      allow(Service).to receive(:find).and_return(service)
      allow(service).to receive(:destroy)
      delete :destroy, :id => id1
      expect(flash[:notice]).to match(/^\'[^']*\' deleted.$/)  
    end
    
    it 'Redirects to the movies page' do
      allow(Service).to receive(:find).and_return(service)
      allow(service).to receive(:destroy)
      delete :destroy, :id => id1
      expect(response).to redirect_to(services_path)
    end
    
  end
  
end
