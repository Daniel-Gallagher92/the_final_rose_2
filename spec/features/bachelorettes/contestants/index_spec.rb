require 'rails_helper'

RSpec.describe 'Bachelorette Contestants Index Page' do

  before :each do
    @susie = Bachelorette.create!(name: "Susie Q", season_number: 12, description: "Yet another season of the Bachelorette")
    @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet!")

    @hank = @hannah.contestants.create!(name: "Hank Aaron", age: 25, hometown: "Atlanta, GA")
    @jeff = @hannah.contestants.create!(name: "Jeff Beans", age: 25, hometown: "Atlanta, GA")
    @jim = @hannah.contestants.create!(name: "Jim Brown", age: 30, hometown: "Cleveland, OH")

    @sally = @susie.contestants.create!(name: "Sally Ride", age: 25, hometown: "Los Angeles, CA")
    @steve = @susie.contestants.create!(name: "Steve Jobs", age: 30, hometown: "San Francisco, CA")
  end

  it 'I see a list of names of the contestants for that bachelorette' do

    visit "/bachelorettes/#{@hannah.id}/contestants"

    expect(page).to have_content(@hank.name)
    expect(page).to have_content(@hank.age)
    expect(page).to have_content(@hank.hometown)
    expect(page).to have_content(@jim.name)
    expect(page).to have_content(@jim.age)
    expect(page).to have_content(@jim.hometown)
    
    expect(page).to_not have_content(@sally.name)
    expect(page).to_not have_content(@steve.name)
    
    click_link("#{@hank.name}")
    expect(current_path).to eq("/contestants/#{@hank.id}")
  end

  it 'I see a unique list of hometowns for the contestants for that bachelorette' do 
    
    hank = @hannah.contestants.create!(name: "Hank Aaron", age: 25, hometown: "Atlanta, GA")
    jeff = @hannah.contestants.create!(name: "Jeff Beans", age: 25, hometown: "Atlanta, GA")
    jim = @hannah.contestants.create!(name: "Jim Brown", age: 30, hometown: "Cleveland, OH")

    visit "/bachelorettes/#{@hannah.id}/contestants"
    
    expect(page).to have_content("Atlanta, GA", count: 1)
    expect(page).to have_content("Cleveland, OH", count: 1)
    save_and_open_page
  end
end