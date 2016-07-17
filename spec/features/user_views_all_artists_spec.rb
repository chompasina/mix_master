require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they view all artists in the index" do
    artists = %w(Beatles, Stones, Edward Sharpe).map do |artist_name|
    Artist.create(name: artist_name, image_path: "http://media-cache-ec0.pinimg.com/avatars/the1964beatles_1364425516_140.jpg")
  end

  visit artists_path

  artists.each do |artist|
    expect(page).to have_link artist.name, href: artist_path(artist)
    end
  end
end
