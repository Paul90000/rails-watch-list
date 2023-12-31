# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Bookmark.destroy_all
Movie.destroy_all

require 'open-uri'
require 'json'

url = "http://tmdb.lewagon.com/movie/top_rated"
movies_data = URI.open(url).read
movies = JSON.parse(movies_data)["results"]

# iterate through the movies and seed them:
movies.each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
end
