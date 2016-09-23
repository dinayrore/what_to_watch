# Movie class

require 'CSV'
CSV.foreach('movie_data/demographics.txt') do |row|
  puts row
end

class Movie
  attr_reader :movie_id, :title, :genre

  def initialize(movie_id, title, genre)
    @movie_id = movie_id
    @title = title
    @genre = genre
  end

  def average_ratings
    # find all movies with same movie id and average ratings
  end

  def is_similar?
  end

end
