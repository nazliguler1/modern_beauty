class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all	
  end

  def show
  end

  def new
    @reservation = Reservation.new	
  end

  def edit
	end
	
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to @reservation, notice: 'Reservation created.'
    else
      render :new
      
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservation_path, notice: 'Reservation updated.'
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    flash[:notice] = "Reservation removed."
    redirect_to services_path
  end

  private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:name, :service_location, :date)
    end
end
