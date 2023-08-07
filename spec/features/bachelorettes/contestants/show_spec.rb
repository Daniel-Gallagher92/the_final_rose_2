require 'rails_helper'

RSpec.describe 'Contestants Show Page' do 
  describe "when I visit a contestants show page" do
    before :each do
      @susie = Bachelorette.create!(name: "Susie Q", season_number: 12, description: "Yet another season of the Bachelorette")
      @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet!")
  
      @hank = @hannah.contestants.create!(name: "Hank Aaron", age: 25, hometown: "Atlanta, GA")
      @jim = @hannah.contestants.create!(name: "Jim Brown", age: 30, hometown: "Cleveland, OH")  

      @park = Outing.create!(name: "Picnic", location: "Cheeseman", date: "09/12/19")
      @helicopter = Outing.create!(name: "Flying", location: "Air", date: "09/13/19")
      @baseball = Outing.create!(name: "Sports", location: "Ball park", date: "09/14/19")

      ContestantOuting.create!(contestant_id: @hank.id, outing_id: @park.id)
      ContestantOuting.create!(contestant_id: @hank.id, outing_id: @helicopter.id)
      ContestantOuting.create!(contestant_id: @hank.id, outing_id: @baseball.id)
    end

    it "I see that contestants name, season number, and season description" do
      visit "/contestants/#{@hank.id}"
      
      expect(page).to have_content("Hank Aaron")
      expect(page).to have_content("Season: 15")
      expect(page).to have_content("The Most Dramatic Season Yet!")
      expect(page).to have_content("Outings:")
      expect(page).to have_content("Picnic")
      expect(page).to have_content("Flying")
      expect(page).to have_content("Sports")
      
      expect(page).to_not have_content("Jim Brown")

      click_link("Picnic")
      expect(current_path).to eq("/outings/#{@park.id}")
    end
  end
end