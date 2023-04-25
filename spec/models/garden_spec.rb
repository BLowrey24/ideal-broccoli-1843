require 'rails_helper'

RSpec.describe Garden do
  before(:each) do
    @garden1 = Garden.create!(name: "Turing Community Garden", organic: true)
   
    @plot1 = @garden1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot3 = @garden1.plots.create!(number: 5, size: "Small", direction: "West")

    @plant1 = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant2 = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant3 = Plant.create!(name: "Tomato", description: "Prefers no soil.", days_to_harvest: 55)
    @plant4 = Plant.create!(name: "Sun Flower", description: "100 days exactly to harvist.", days_to_harvest: 100)
    @plant5 = Plant.create!(name: "Rose", description: "Over 100 days to harvest.", days_to_harvest: 110)

    PlotPlant.create!(plot: @plot1, plant: @plant1)
    PlotPlant.create!(plot: @plot3, plant: @plant3)
    PlotPlant.create!(plot: @plot3, plant: @plant1)
    PlotPlant.create!(plot: @plot1, plant: @plant4)
    PlotPlant.create!(plot: @plot1, plant: @plant5)
  end

  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots)}
  end

  describe 'instance methods' do
    describe '#quick_harvist_plants' do
      it 'returns the plants of the gardens plots that are uniq and less then 100 days to harvist' do
        expect(@garden1.quick_harvest_plants).to eq([@plant1, @plant3])
      end
    end
  end
end
