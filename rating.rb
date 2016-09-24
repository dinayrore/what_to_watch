# Ratings class - see rspec for further details.
require 'CSV'

class Rating
  def read_ratings_data_file
    puts 'One moment please...'
    @ratings_data = []
    CSV.foreach('data.txt') do |row|
      subarray = row[0].gsub(/\s+/, ',').split(',')
      @ratings_data << subarray
    end
  end

  def retrieve_ratings
    all_ratings = Rating.new
    all_ratings.read_ratings_data_file
    @movie_ratings = []
    @ratings_data.each do |subarray|
      if @movie_id == subarray[1]
        @movie_ratings << subarray[2]
      end
      if @user_id == subarray[0]
        @movie_ratings << subarray[2]
      end
    end
    print @movie_ratings
  end

  def average_ratings
    rating = Rating.new
    rating.read_ratings_data_file
    sum = 0
    @movie_ratings.each { |rating| sum += rating }
    @average_rating = sum.to_f / @movie_ratings.count.to_f.round(1)
    print "The average rating of your movie is #{@average_rating} stars!"
  end
end
