class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @plants = @garden.quick_harvest_plants
  end
end