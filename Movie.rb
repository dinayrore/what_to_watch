# Movie class

require 'CSV'
CSV.foreach('movie_data/demographics.txt') do |row|
  puts row
end

class Movie
  # attr_

  def initialize(movie_id, title, genre)
    @movie_id = movie_id
    @title = title
    @genre = genre
  end

  def average_ratings
  end

  def is_similar?
  end

end
