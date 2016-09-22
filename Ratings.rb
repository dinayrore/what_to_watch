# Rating class

require 'CSV'
CSV.foreach('movie_data/ratings.txt') do |row|
  puts row
end

class Ratings
  # attr_
  def initialize(movie_id, user_id, rating)
    @movie_id = movie_id
    @user_id = user_id
    @rating = rating
  end

  def is_similar?
    # sort/arrange ratings by rating value
  end

end
