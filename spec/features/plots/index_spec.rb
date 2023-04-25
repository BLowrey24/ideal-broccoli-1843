require 'rails_helper'

RSpec.describe 'Plots index page', type: :feature do
  before(:each) do
    @garden = Garden.create!(name: "Turing Community Garden", organic: true)

    @plot1 = @garden.plots.create!(number: 25, size: "Large", direction: "East")
    @plot2 = @garden.plots.create!(number: 15, size: "Medium", direction: "South")
    @plot3 = @garden.plots.create!(number: 5, size: "Small", direction: "West")

    @plant1 = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant2 = Plant.create!(name: "Purple Beauty", description: "Needs water all the time.", days_to_harvest: 20)
    @plant3 = Plant.create!(name: "Sweet Bell Pepper", description: "Prefers no soil.", days_to_harvest: 55)

    PlotPlant.create!(plot: @plot1, plant: @plant1)
    PlotPlant.create!(plot: @plot2, plant: @plant2)
    PlotPlant.create!(plot: @plot3, plant: @plant3)

    visit plots_path
  end

  describe 'When I visit the Plots index page' do
    it 'I see a list of all plot numbers and under each of them I see the names of all the plots plants' do
      expect(page).to have_content(@plot1.number)
      expect(page).to have_content(@plot2.number)
      expect(page).to have_content(@plot3.number)

      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)
    end
  end
end