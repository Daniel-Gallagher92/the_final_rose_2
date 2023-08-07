require 'rails_helper'

RSpec.describe Outing, type: :model do

  describe 'relationships' do
    it { should have_many :contestant_outings }
    it { should have_many(:contestants).through(:contestant_outings) }
  end

  describe 'instance methods' do
    before :each do
      @susie = Bachelorette.create!(name: "Susie Q", season_number: 12, description: "Yet another season of the Bachelorette")
      @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet!")
  
      @hank = @hannah.contestants.create!(name: "Hank Aaron", age: 25, hometown: "Atlanta, GA")
      @jim = @hannah.contestants.create!(name: "Jim Brown", age: 30, hometown: "Cleveland, OH")  

      @park = Outing.create!(name: "Picnic", location: "Cheeseman", date: "09/12/19")
      @helicopter = Outing.create!(name: "Flying", location: "Air", date: "09/13/19")
      @baseball = Outing.create!(name: "Sports", location: "Ball park", date: "09/14/19")

      ContestantOuting.create!(contestant_id: @hank.id, outing_id: @park.id)
      ContestantOuting.create!(contestant_id: @jim.id, outing_id: @park.id)
      ContestantOuting.create!(contestant_id: @hank.id, outing_id: @baseball.id)
    end

    it '#count_of_contestants' do
      expect(@park.count_of_contestants).to eq(2)
      expect(@baseball.count_of_contestants).to eq(1)
    end
  end
end