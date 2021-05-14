class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  
  def index
    @service = Service.all
  end
  
  def show
    id = params[:id]
    @service = Service.find(id)
  end
  
  def new
    @service = Service.new
  end
  
  def edit
    @service = Service.find(params[:id])
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
    @service = Service.find(params[:id])
    
    if @service.update(service_params)
      redirect_to @service, notice: 'Service was successfully updated.'
    else
      render 'edit'
    end
  end
  
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    flash[:notice] = "'#{@service.name}' deleted"
    redirect_to services_index_path
  
  end
  
  
  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :category, :location, :rating, :price)
    end
end