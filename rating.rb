# Ratings class - see rspec for further details.
require 'CSV'

class Rating

  def retrieve_ratings_movie_id(ratings_data, movie_id)
    movie_ratings = []
    ratings_data.each do |subarray|
      if movie_id == subarray[1]
        movie_ratings << subarray[2].to_i
      end
    end
    puts "The following are all of the ratings found for movie ID number #{movie_id}: #{movie_ratings}"
  end

  def average_rating(ratings_data, movie_id)
    movie_ratings = []
    ratings_data.each do |subarray|
      if movie_id == subarray[1]
        movie_ratings << subarray[2].to_i
          sum = 0
          movie_ratings.each do |rating|
            sum += rating
            average_rating = sum / movie_ratings.count
          end
     end
    end
    print "The average rating of your movie is #{average_rating} stars!"
  end

  def retrieve_ratings_user_id(ratings_data, movie_id)
    movie_ratings = []
    ratings_data.each do |subarray|
      if user_id == subarray[0]
        movie_ratings << subarray[2]
      end
    end
  end
end
