require 'rails_helper'

RSpec.describe 'Bachelorette Show Page' do
  #     As a visitor,
  # When I visit '/bachelorettes/:id',
  # I see that bachelorette's:
  # -Name
  # -Season Number
  # -Description of Season that they were on
  # (e.g.             
  #                   Hannah Brown
  #     Season 15 - The Most Dramatic Season Yet!
  #   )
  # I also see a link to see that bachelorette's contestants
  # When I click on that link
  # I'm taken to "/bachelorettes/:bachelorette_id/contestants"
  # and I can see only that bachelorette's contestants

  before :each do
    @susie = Bachelorette.create!(name: "Susie Q", season_number: 12, description: "Yet another season of the Bachelorette")
    @hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The Most Dramatic Season Yet!")
    @jim = @hannah.contestants.create!(name: "Jim Brown", age: 30, hometown: "Cleveland, OH")
    @hank = @hannah.contestants.create!(name: "Hank Aaron", age: 25, hometown: "Atlanta, GA")
  end

  it "I see that bachelorette's name, season number, and description" do
    visit "/bachelorettes/#{@hannah.id}"
    
    expect(page).to have_content(@hannah.name)
    expect(page).to have_content(@hannah.season_number)
    expect(page).to have_content(@hannah.description)
  end

  it "I see a link to see that bachelorette's contestants" do
    visit "/bachelorettes/#{@hannah.id}"

    expect(page).to have_link("See Contestants")
    click_link("See Contestants")
    expect(current_path).to eq("/bachelorettes/#{@hannah.id}/contestants")
    expect(page).to have_content("Jim Brown")

    expect(page).to have_content("Hank Aaron")
  end

  it 'I see the average age of the contestants for that bachelorette' do 
    visit "/bachelorettes/#{@hannah.id}"

    expect(page).to have_content("Average Age of Contestants: 27.5")
  end
end