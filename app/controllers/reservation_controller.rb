class ReservationController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  
  def index
    @reservations = Reservation.all
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
