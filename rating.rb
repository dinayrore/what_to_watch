# Ratings class - see rspec for further details.
class Rating
  def initialize(*_)
    @movie_id = *_
    @movie_ratings = *_
    @user_id = *_

  end

  def retrieve_all_ratings_for_movie_id(ratings_data, movie_id)
    @movie_ratings = []
    ratings_data.each do |subarray|
      if movie_id == subarray[1]
        @movie_ratings << subarray[2].to_i
      end
    end
    puts "The following are all of the ratings found for movie ID number #{movie_id}:" "\n" "#{@movie_ratings}"
  end

  def average_rating_for_movie_id(ratings_data, movie_id)
    @movie_ratings = []
    ratings_data.each do |subarray|
      if movie_id == subarray[1]
        @movie_ratings << subarray[2].to_i
      end
      @movie_ratings
    end
    sum = 0
    @movie_ratings.each do |rating|
      sum += rating
      @average_rating = sum / @movie_ratings.count
    end
     puts "The average rating of your movie is #{@average_rating} stars!"
  end

  def retrieve_ratings_by_user_id(ratings_data, user_id)
    @user_ratings = []
    ratings_data.each do |subarray|
      if user_id == subarray[0]
        @user_ratings << subarray[2].to_i
      end
      @user_ratings
    end
    sum = 0
    @user_ratings.each do |rating|
      sum += rating
    end
    puts "The user ID number #{user_id} has made #{sum} ratings."
  end
end
