require 'CSV'
require 'pry'
require_relative 'Movie'
require_relative 'User'
require_relative 'Ratings'

def obtain_user_demographics
  users = []
  user_demographics = []
  CSV.foreach('movie_data/demographics.txt') do |row|
    2.times { row.pop }
    users << row
  end
  users.each do |data|
    user_demographics << User.new(data[0], data[1], data[2])
  end
end

def obtain_movie_rating
  ratings = []
  movie_ratings = []
  CSV.foreach('movie_data/ratings.txt') do |row|
    row = row[0].gsub(/\s+/, ',').split('\n')
    ratings << row
  end
  ratings.each do |data|
    data.pop
    movie_ratings << Ratings.new(data[0], data[1], data[2]) # stores all of my movie data as objects of the Ratings class.
  end
end

def obtain_movies(movie_genres)
  movies = []
  genre = []
  movies_and_genres = []
  CSV.foreach('movie_data/movies.txt') do |row|
    row = row[0].gsub(/\|/, ",").split('\n')
    genre << row[-20..-1]
    21.times do row.pop
    movies << row
      genre.each do |number|
        movie_genres.each do |type|
          if number == "1"
             movies << type
           end
         end
      end
    end
  end
  movies.each do |data|
    movies_and_genres << Movies.new(data[0], data[1], data[2])
    # movies.sort # stores all of my movie data as objects of the Movie class.
  end
end

def start_up
  puts 'Are you bored? Unsure of what to do with your life?'
  puts 'Why not waste time watching one of the thousands of films our highly qualified users recommends!'
  search_by_rating
end

def search_by_rating
  print 'Please enter a rating (1-5) and our program will automatically suggest the top 10 movies you could watch: '
  number = gets.chomp
  unless %w(1..5).include?(number)
    puts 'Invalid input. Try again.'
    search_by_rating
  end
end

def search_by_options
  print # movies hash with keys as ratings sorted into top ten and values as movie title.
  puts 'Not satisfied with your choices?'
  puts 'Well you can also search by genre! Would you like to search by genre?'
  print 'Please type \'Y\' to search by genre.'
  user_input = gets.chomp.upcase
  exit if input != 'Y'
end

def search_by_genre(movie_genres)
  print "Please enter a genre and we will let you know if we've got it!"
  type = gets.chomp
  unless movie_genres.include?(type)
    puts 'Invalid input. Try again.'
    search_by_genre
  end
  processing_data
end

def processing_movie_results
  puts 'Processing... Processing... Processing...'
  puts 'Here ya go! Enjoy wasting time!'
  # if #search_by_rating
  #   search_by_rating
  # elsif search_by_genre
  # elsif search_by_gender
  # else 'Try going outside!'
  # end
end

# something to get it to search_by_genre if none of those options are good enough...

def main
  movie_genres = ['unknown', 'Action', 'Adventure', 'Animation', "Children's", 'Comedy', 'Crime', 'Documentary', 'Drama', 'Fantasy', 'Film-Noir', 'Horror', 'Musical', 'Mystery', 'Romance' 'Sci-Fi', 'Thriller', 'War', 'Western']
  # obtain_user_demographics
  # obtain_movie_rating
  # obtain_movies(movie_genres)
  start_up
  search_by_rating
  processing_movie_results
  search_by_options
end

main if __FILE__ == $PROGRAM_NAME
