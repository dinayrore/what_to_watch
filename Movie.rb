# Movie class

require 'CSV'
CSV.foreach('movie_data/demographics.txt') do |row|
  puts row
end

class Movie
  movie id
  title
  genre
  rating

  def average_ratings
  end

  def is_similar?
  end

end
