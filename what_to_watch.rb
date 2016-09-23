require 'CSV'
require 'Movies'
require_relative 'User'
require_relative 'Ratings'

def obtain_user_demographics
  user_demographics = []
  CSV.foreach('movie_data/demographics.txt') do |row|
    user_demographics << row
  end
  user_demographics.each do |data|
    data.pop
    data.pop
    user_demographics << User.new(data[0], data[1], data[2]) # stores all of my users as objects of the User class.
  end
end

def obtain_movie_rating
  movie_rating = []
  CSV.foreach('movie_data/ratings.txt') do |row|
    row = row.gsub(/\s+/, ",").split('\n')
    movie_rating << row
  end
  movie_rating.each do |data|
    data.pop
    movie_rating << Ratings.new(data[0], data[1], data[2]) # stores all of my movie data as objects of the Ratings class.
  end
end

def obtain_movies
  movies = []
  genre = []
  CSV.foreach('movie_data/movies.txt') do |row|
    row = row.gsub((\|), ",").split('\n')
    genre << row[-20..-1]
    21.times do row.pop
    movies << row
    movies << genre
  end
  movies.each do |data|
    movies << Movies.new(data[0], data[1], data[2]) # stores all of my movie data as objects of the Movie class.
  end
end

def start_up
  puts 'Are you bored? Unsure of what to do with your life?'
  puts 'Why not waste time watching one of the thousands of films our highly qualified users recommend?'
  print 'Please enter a rating (1-5) and our program will automatically suggest the top 10 movies you could watch: '
  @user_input = gets.chomp
  unless %w(1..5).include?(@user_input)
    puts 'Invalid input. Try again.'
    start_up
end

def processing_movie_ratings
  puts 'Processing... Processing... Processing...'
  puts 'Here ya go! Enjoy wasting time!'
  print # movies hash with keys as ratings sorted into top ten and values as movie title.
  # something to get it to search_by_genre if none of those options are good enough...
end

def search_by_genre
  puts 'Not satisfied with your choices?'
  puts 'Well you '
end


def main
  obtain_user_demographics
  obtain_movie_rating
  obtain_movies
  start_up
  processing_movie_ratings

end

main if __FILE__ == $PROGRAM_NAME
