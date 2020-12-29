class MapsController < ApplicationController
  def index
    @map_place = MapPlace.new
    @map_places = MapPlace.all
    gon.map_places = MapPlace.paginate(page: params[:page])
  end

  def create
    @map_place = MapPlace.new(map_place_params)
    if @map_place.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def map_place_params
    params.require(:map_place).permit(:place_name, :description, :latitude, :longitude)
  end
end
