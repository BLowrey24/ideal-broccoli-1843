class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    # require 'pry'; binding.pry
    @plants = @garden.quick_harvest_plants
  end
end