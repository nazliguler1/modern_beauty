require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  
  before(:each) do
    @user = User.create!(name: 'SUNY Tester', email: 'stester@binghamton.edu')
    @auth = Authorization.create!(provider: "github", uid: "123456", user_id: @user.id)
    session[:user_id] = @user.id
    @current_user = @user
  end
  
  describe "#index" do
    
    it 'retrieves all of the reservations' do  
      get :index
      expect(assigns(:reservations)).to eq(Reservation.all)
    end
    
    it 'renders index template' do
      get :index
      expect(response).to render_template('index')
    end
    
  end

  describe "#show" do
    let(:id1) {'1'}
    let(:reservation) {instance_double('Reservation', name: 'Reservation1')}

    it 'renders show template' do
      allow(Reservation).to receive(:find).and_return(reservation)
      get :show, id: id1
      expect(response).to render_template('show')
    end
    
    it 'makes the movie available to the template' do
      allow(Reservation).to receive(:find).and_return(reservation)
      get :show, id: id1 
      expect(assigns(:reservation)).to eq(reservation)
    end
    
     it 'makes the reservation available to the template' do
      allow(Reservation).to receive(:find).and_return(reservation)
      get :show, id: id1 
      expect(assigns(:reservation)).to eq(reservation)
    end
    
  end

  describe "#new" do
    let(:id1) {'1'}
    let(:reservation) {instance_double('Reservation', name: 'Reservation1')}
    
    it 'creates an instance of the reservation model' do
      get :new
      expect(assigns[:reservation]).to be_instance_of(Reservation)
    end
    
    it 'selects the new template for rendering' do
      allow(Reservation).to receive(:find).and_return(reservation)
      get :new, id: id1
      expect(response).to render_template(:new)
    end

  end

  describe "#edit" do
    let(:id1) {'1'}
    let(:reservation) {instance_double('Reservation', name: 'Reservation1')}  
    
    it 'renders the edit template' do
      allow(Reservation).to receive(:find).and_return(reservation)
      get :edit, id: id1
      expect(response).to render_template('edit')
    end
    
  end
  
  describe "#create" do
    let(:id1) {'1'}
    let(:params) {{name: 'BU: Be You', location: '123 Road St. Binghamton, NY', date: ''}}
    let(:reservation) {instance_double('Reservation', name: 'Reservation1')}
    
    context "with valid params" do
      it 'redirect to reservations list page' do
        post :create, reservation: params
        expect(response).to redirect_to(Reservation.last)
      end
    end

  end
  
  describe "DELETE #destroy" do
    let(:id1) {'1'}
    let(:reservation) {instance_double('Reservation', name: 'Reservation1')}
 
    it 'retrieves the reservation' do
      expect(Reservation).to receive(:find).and_return(reservation)

      allow(reservation).to receive(:destroy)
      delete :destroy, :id => id1
    end

    it 'deletes the service' do
      allow(Reservation).to receive(:find).and_return(reservation)
      expect(reservation).to receive(:destroy)
      delete :destroy, :id => id1
    end
    
    it 'sets the flash message' do
      allow(Reservation).to receive(:find).and_return(reservation)
      allow(reservation).to receive(:destroy)
      delete :destroy, :id => id1
      expect(flash[:notice]).to match("Reservation removed.")  
    end
    
    it 'Redirects to the services page' do
      allow(Reservation).to receive(:find).and_return(reservation)
      allow(reservation).to receive(:destroy)
      delete :destroy, :id => id1
      expect(response).to redirect_to(services_path)
    end
    
  end
  
end
