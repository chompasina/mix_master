require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they delete the page for the individual artist" do
    artist = Artist.create(name: "Ed Sharpe", image_path: "http://d2752rta4dscqv.cloudfront.net/ImageCache/edward-sharpe-and-the-magnetic-zeros-h-0913.9fc93bceab7606e07a84c6bcb0bde77d.jpg")

    visit artist_path(artist)
    click_on "Delete"

    expect(page).to_not have_content artist.name
    expect(page).to_not have_css("img[src=\"#{artist.image_path}\"]")

  end
end
