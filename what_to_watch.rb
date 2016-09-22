require 'CSV'
# require 'Movies'
require 'User'
require 'Rating'

def obtain_user_demographics
  user_demographics = []
  CSV.foreach('movie_data/demographics.txt') do |row|
    row = row.split(\n)
    user_demographics << row
    puts user_demographics
  end
  user_demographics.each do |data|
    data.pop
    data.pop
    User.new(data[0], data[1], data[2]) # stores all of my users as an instance of the User class.
  end
end

def obtain_movie_data
  movie_data= []
  CSV.foreach('movie_data/ratings.txt') do |row|
    row = row.gsub(/\s+/, ",").split(\n)
    movie_data << row
    puts movie_data
  end
  movie_data.each do |data|
    data.pop
    Ratings.new(data[0], data[1], data[2]) # stores all of my movie data as an instance of the Ratings class.
  end
end


def main
  obtain_user_demographics
  obtain_movie_data

end

main if __FILE__ == $PROGRAM_NAME
