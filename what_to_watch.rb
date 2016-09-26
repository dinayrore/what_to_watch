require 'pry'
require 'CSV'
require_relative 'movie'
require_relative 'rating'
require_relative 'user'

def start_program
  puts 'Are you bored? Unsure of what to do with all your free time?'
  puts "Why not watch a movie? Don't worry, we'll recommend movies for you!" "\n "
end

def prompt_user_search
  puts 'Please choose from the following options:'
  puts '(1) Search by movie ID number.'
  puts '(2) Search by user ID'
  first_option = gets.chomp.upcase
  if first_option == 'N'
    conduct_a_different_search_option
  elsif !%w(1 2).include?(first_option)
    puts 'Invalid input. Try again.'
    prompt_user_search
  else
    search_by_options(first_option)
  end
end

def search_by_options(first_option)
  if first_option == '1'
    search_by_movie_id(first_option)
  else
    search_by_user_id(first_option)
  end
end

def return_to_prompt_user_search(first_option)
  puts 'Would you like to go back to the main menu options? Type \'Y\'.'
  user_input = gets.chomp.upcase
    if user_input == 'Y'
      prompt_user_search
    elsif user_input == 'N'
      conduct_a_different_search_option(user_input)
    else
      puts 'Invalid input. Try again.'
      return_to_prompt_user_search(first_option)
    end
end

def conduct_a_different_search_option(*_)
  puts 'Would you like to conduct a different search? Type \'Y\'.'
  new_input = gets.chomp.upcase
  if new_input == 'Y'
    prompt_user_search_top_options(new_input)
  else
    exit
  end
end

def prompt_user_search_top_options(user_input)
  puts 'Please choose from the following options:'
  puts '(1) Search top movies by average rating for a movie rating. '
  puts '(2) Search top movies by average rating for user ID'
  top_option_input = gets.chomp
  if !%w(1 2).include?(top_option_input)
    puts 'Invalid input. Try again.'
    prompt_user_search_top_options(user_input)
  else
    search_by_top_options(user_input, top_option_input)
  end
end

def search_by_top_options(user_input, top_option_input)
  if top_option_input == '1'
    obtain_top_movies_value(user_input)
  else
    # search_top_movies_by_user_id
  end
end

def obtain_top_movies_value(user_input)
  print 'How many movies would you like us to recommend? '
  top_movies_number = gets.chomp.to_i
    if top_movies_number == 0
    puts 'Invalid input. Try again.'
    obtain_top_movies_value(user_input)
    else
    search_for_top_movies(top_movies_number, user_input)
    end
end

def search_for_top_movies(top_movies_number, user_input)
  puts 'Processing...Processing...Processing...'
  ratings_data = []
  CSV.foreach('data.txt', "r:ISO-8859-1") do |row|
    subarray = row[0].gsub(/\s+/, ',').split(',')
    if !subarray.uniq
    ratings_data << subarray
    else
      # sum of numbers / 2 possible average?
    end
  end
  ratings_data.sort_by! { |rating| rating[2] }
  most_popular_movies = ratings_data.reverse!
  top_movies = most_popular_movies[0...top_movies_number]
  top_movies.each do |value|
  puts "#{value[1]}: #{value[2]}"
  end
  conduct_a_different_search_option(user_input)
end

def search_by_movie_id(first_option)
  puts 'Please choose from the following options:'
  puts '(1) Find all ratings'
  puts '(2) Find average ratings'
  puts '(3) Find movie title'
  second_option = gets.chomp
  if !%w(1 2 3).include?(second_option)
    puts 'Invalid input. Try again.'
    return_to_prompt_user_search(first_option)
  else
    if %w(1 2 3).include?(second_option)
      acquire_movie_id(first_option, second_option)
    end
  end
end

def acquire_movie_id(first_option, second_option)
  print 'Please enter the movie ID number you would like to search: '
  movie_id = gets.chomp
  if [*"1".."1682"].include?(movie_id)
    read_data_files(first_option, second_option, movie_id)
  else
    acquire_movie_id(first_option, second_option)
  end
end

def read_data_files(first_option, second_option, movie_id)
  if second_option == '1'
    obtain_all_ratings(first_option, movie_id)
  elsif second_option == '2'
    obtain_average_ratings(first_option, movie_id)
  elsif second_option == '3'
    read_movie_data_file(first_option, movie_id)
  else
    puts 'Invalid input. Try again.'
    read_data_files
  end
end

def obtain_all_ratings(first_option, movie_id)
  puts 'This may take a while...'
  ratings_data = []
  CSV.foreach('data.txt', "r:ISO-8859-1") do |row|
    subarray = row[0].gsub(/\s+/, ',').split(',')
    ratings_data << subarray
  end
  rating = Rating.new(ratings_data, movie_id)
  rating.retrieve_all_ratings_for_movie_id(ratings_data, movie_id)
  return_to_prompt_user_search(first_option)
end

def obtain_average_ratings(first_option, movie_id)
  puts 'One moment please...'
  ratings_data = []
  CSV.foreach('data.txt', "r:ISO-8859-1") do |row|
    subarray = row[0].gsub(/\s+/, ',').split(',')
    ratings_data << subarray
  end
  rating = Rating.new(ratings_data, movie_id)
  rating.average_rating_for_movie_id(ratings_data, movie_id)
  return_to_prompt_user_search(first_option)
end

def read_movie_data_file(first_option, movie_id)
  movie_data = []
  CSV.foreach('item.txt', "r:ISO-8859-1") do |row|
    subarray = row[0].gsub(/\|/, ',').split(',')
    movie_data << subarray
  end
  movie = Movie.new
  movie.find_title(movie_data, movie_id)
  return_to_prompt_user_search(first_option)
end

def search_by_user_id(first_option)
  puts 'Would you like to find all of the ratings made by a user? Type \'Y\'.'
  user_input = gets.chomp.upcase
    if user_input == 'Y'
      complete_search_by_user_id
    else
      return_to_prompt_user_search(first_option)
    end
end

def complete_search_by_user_id
  print 'Please enter the user ID number you would like to search: '
  user_id = gets.chomp
  ratings_data = []
  CSV.foreach('data.txt', "r:ISO-8859-1") do |row|
    subarray = row[0].gsub(/\s+/, ',').split(',')
    ratings_data << subarray
  end
  user = Rating.new
  user.retrieve_ratings_by_user_id(ratings_data, user_id)
end

def main
  start_program
  prompt_user_search
end

main if __FILE__ == $PROGRAM_NAME
