# Rating class

class Ratings
  attr_reader :movie_id, :user_id, :rating

  def initialize(movie_id, user_id, rating)
    @movie_id = movie_id
    @user_id = user_id
    @rating = rating
  end

  def is_similar?
    # sort/arrange ratings by rating value
  end

end
