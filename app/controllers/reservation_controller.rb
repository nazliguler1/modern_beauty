class ReservationController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservation = Reservation.all	
  end

  def show
		id = params[:id]
    @reservation = Reservation.find(id)
  end

  def new
		@reservation= Reservation.create!(:time_in=>DateTime.now())	
	
		flash[:notice] = "You have made a reservation"
		redirect_to reservation_index_path(@reservation)
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
      redirect_to reservation_index_path, notice: 'Reservation updated.'
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to services_index_path, notice: 'Reservation removed.'
  end

  private

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:name, :category, :location, :rating, :price, :date, :user)
    end
end
