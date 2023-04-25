require 'rails_helper'

RSpec.describe 'Gardens show page', type: :feature do
  before(:each) do
    @garden1 = Garden.create!(name: "Turing Community Garden", organic: true)
    @garden2 = Garden.create!(name: "Turing Community Garden", organic: true)

    @plot1 = @garden1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot2 = @garden2.plots.create!(number: 15, size: "Medium", direction: "South")
    @plot3 = @garden1.plots.create!(number: 5, size: "Small", direction: "West")

    @plant1 = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant2 = Plant.create!(name: "Purple Beauty", description: "Needs water all the time.", days_to_harvest: 20)
    @plant3 = Plant.create!(name: "Tomato", description: "Prefers no soil.", days_to_harvest: 55)
    @plant4 = Plant.create!(name: "Sun Flower", description: "100 days exactly to harvist.", days_to_harvest: 100)
    @plant5 = Plant.create!(name: "Rose", description: "Over 100 days to harvest.", days_to_harvest: 110)

    PlotPlant.create!(plot: @plot1, plant: @plant1)
    PlotPlant.create!(plot: @plot2, plant: @plant2)
    PlotPlant.create!(plot: @plot3, plant: @plant3)
    PlotPlant.create!(plot: @plot3, plant: @plant1)
    PlotPlant.create!(plot: @plot1, plant: @plant4)
    PlotPlant.create!(plot: @plot1, plant: @plant5)
    
    visit garden_path(@garden1)
  end

  describe 'when I visit a Gardens show page' do
    it 'I see a list of plants that are incleded in that gardens plots' do
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant3.name)
      expect(page).to_not have_content(@plant4.name)
      expect(page).to_not have_content(@plant5.name)
    end 
  end
end