# Ratings class - see rspec for further details.
require '../movie_lens'

class Rating < MovieLens

  def retrieve_ratings
    @movie_ratings = []
    @ratings_data.each do |subarray|
      if @movie_id == subarray[1]
        @movie_ratings << subarray[2]
      end
      if @user_id == subarray[0]
        @movie_ratings << subarray[2]
      end
    end
  end

  def average_ratings
    sum = 0
    @movie_ratings.each { |rating| sum += rating }
    @average_rating = sum.to_f / @movie_ratings.count.to_f.round(1)
  end
end
