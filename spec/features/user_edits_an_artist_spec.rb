require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they see the page for the individual artist" do
    artist = Artist.create(name: "Please", image_path: "http://d2752rta4dscqv.cloudfront.net/ImageCache/edward-sharpe-and-the-magnetic-zeros-h-0913.9fc93bceab7606e07a84c6bcb0bde77d.jpg")
    updated_name = "Edward Sharpe and the Magnetic Zeros"

    visit artist_path(artist)
    click_on "Edit"
    fill_in "artist_name", with: updated_name
    click_on "Update Artist"


    expect(page).to have_content updated_name
    expect(page).to_not have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
