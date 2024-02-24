class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def new
  end

  def create
    @place = Place.new

    @place["name"] = params["name"]
    
    @place.save

    redirect_to "/places"
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
  end

  def destroy
    @place = Place.find_by({ "id" => params["id"] })

    @place.destroy

    redirect_to "/places"
  end
end
