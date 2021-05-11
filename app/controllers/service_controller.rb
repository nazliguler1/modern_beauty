class ServiceController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  
  def index
    @service = Service.all
  end
  
  def show
    id = params[:id]
    @service = Service.find(id)
  end
  
  def edit
  end
  
  def update
    
  end
  
  def destroy
    
  end
end