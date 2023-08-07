require 'rails_helper'

RSpec.describe 'Outing Show Page' do 
  describe "when i visit an outings show page" do
    before :each do
      @susie = Bachelorette.create!(name: "Susie Q", season_number: 12, description: "Yet another season of the Bachelorette")
      @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet!")
  
      @hank = @hannah.contestants.create!(name: "Hank Aaron", age: 25, hometown: "Atlanta, GA")
      @jim = @hannah.contestants.create!(name: "Jim Brown", age: 30, hometown: "Cleveland, OH")  

      @park = Outing.create!(name: "Picnic", location: "Cheeseman", date: "09/12/19")
      @helicopter = Outing.create!(name: "Flying", location: "Air", date: "09/13/19")
      @baseball = Outing.create!(name: "Sports", location: "Ball park", date: "09/14/19")

      ContestantOuting.create!(contestant_id: @jim.id, outing_id: @park.id)
      ContestantOuting.create!(contestant_id: @hank.id, outing_id: @park.id)
      ContestantOuting.create!(contestant_id: @hank.id, outing_id: @baseball.id)
    end
    it "I see that outings name, location, and date" do
      visit "/outings/#{@park.id}"
      
      expect(page).to have_content("Picnic's Show Page")
      expect(page).to have_content("Cheeseman")
      expect(page).to have_content("09/12/19")
      expect(page).to have_content("Count of Contestants: 2")
      expect(page).to have_content("Hank Aaron")
      expect(page).to have_content("Jim Brown")
    end

    it 'I see a link to remove a contestant from the outing' do
      visit "/outings/#{@park.id}"

      expect(page).to have_content("Hank Aaron")
      expect(page).to have_content("Jim Brown")
      expect(page).to have_button("Remove")

      within "#contestant_#{@hank.id}" do
        click_button("Remove")
      end
      
      expect(page).to_not have_content("Hank Aaron")
      expect(page).to have_content("Jim Brown")
    end

    it 'when I visit another outings show page I still see the contestant I removed from the other outing' do 
      visit "/outings/#{@baseball.id}"

      within "#contestant_#{@hank.id}" do
        expect(page).to have_content("Hank Aaron")
      end
    end
  end
end