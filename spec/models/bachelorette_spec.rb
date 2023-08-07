require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  describe "relationships" do
    it {should have_many :contestants}
  end

  describe "instance methods" do
    
    it "#contestants_average_age" do
      hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet!")
      jim = hannah.contestants.create!(name: "Jim Brown", age: 30, hometown: "Cleveland, OH")
      hank = hannah.contestants.create!(name: "Hank Aaron", age: 25, hometown: "Atlanta, GA")

    expect(hannah.contestants_average_age).to eq(27.5)
    end

    it "#contestants_unique_hometowns" do 
      hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet!")
      jim = hannah.contestants.create!(name: "Jim Brown", age: 30, hometown: "Cleveland, OH")
      hank = hannah.contestants.create!(name: "Hank Aaron", age: 25, hometown: "Atlanta, GA")
      jeff = hannah.contestants.create!(name: "Jeff Beans", age: 25, hometown: "Atlanta, GA")

      expect(hannah.contestants_unique_hometowns).to include("Atlanta, GA", "Cleveland, OH")
    end
  end
end
