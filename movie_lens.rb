# MovieLens class - parent class for all other classes in this project.
require 'CSV'

class MovieLens

  def read_movie_data_file
    @movie_data = []
    CSV.foreach('movie_data/u.item') do |row|
      subarray = row[0].gsub(/\|/, ',').split(',')
      @movie_data << subarray
    end
  end

  def read_ratings_data_file
    @ratings_data = []
    CSV.foreach('movie_data/u.data') do |row|
      subarray = row[0].gsub(/\s+/, ',').split(',')
      @ratings_data << subarray
    end
  end

  def read_user_data_file
    @user_data = []
    CSV.foreach('movie_data/u.user') do |row|
      subarray = row[0].gsub(/\|/, ',').split(',')
      @movie_data << subarray
    end
  end

end
