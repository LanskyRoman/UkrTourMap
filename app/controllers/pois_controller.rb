class PoisController < ApplicationController
  def index
    @pois = Poi.all
  end

  def show
    @poi = Poi.find(params[:id])
  end

  def new
    @poi = Poi.new
  end

  def create
    operation = Poi::CreateService.new(params)
    if operation.perform!
      redirect_to poi_path(operation.poi), notice: 'Successfuly added POI!'
    else
      @poi = operation.poi
      render :new
    end
  end

  def edit
    @poi = Poi.find(params[:id])
  end

  def update
    operation = Poi::UpdateService.new(params)
    if operation.perform!
      redirect_to poi_path(operation.poi), notice: 'Successfuly edited POI!'
    else
      @poi = operation.poi
      render :edit, error: 'Error when editiong POI!'
    end
  end

  def destroy
    @poi = Poi.find(params[:id])
    if @poi.destroy
    end
  end
end
