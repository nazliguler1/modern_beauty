class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  
  def index
    @services = Service.all
  end
  
  def show

  end
  
  def new
    @service = Service.new
  end
  
  def edit
    
  end
  
  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to @service, notice: 'Service was successfully created.'
    
    else
      render :new
    
    end
  end
  
  def update
    if @service.update(service_params)
      redirect_to @service, notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @service.destroy
    flash[:notice] = "'#{@service.name}' deleted."
    redirect_to services_path
  
  end
  
  
  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :category, :location, :rating, :price)
    end
end