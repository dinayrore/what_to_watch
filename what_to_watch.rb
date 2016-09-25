require 'pry'
require 'CSV'
require_relative 'movie'
require_relative 'user'
require_relative 'rating'

def start_program
  puts 'Are you bored? Unsure of what to do with all your free time?'
  puts "Why not watch a movie? Don't worry, we'll recommend movies for you!" "\n "
end

def prompt_user_search
  puts 'Please choose from the following options'
  puts '(1) Search by movie ID number.'
  puts '(2) Search by user ID'
  @first_user_input = gets.chomp
  if !%w(1 2).include?(@first_user_input)
    puts 'Invalid input. Try again.'
    prompt_user_search
  else
    if @first_user_input == '1'
      search_by_movie_id
    else
      search_by_user_id
    end
  end
end

def return_to_main_menu
  puts 'Would you like to go back to the main menu options? Type \'Y\'.'
  user_input = gets.chomp.upcase
    if user_input == 'Y'
      prompt_user_search
    elsif user_input == 'N'
      puts 'Would you like to go back to the previous menu options? Type \'Y\'.'
      user_input = gets.chomp.upcase
        if user_input == 'Y'
          if @first_user_input == '1'
            search_by_movie_id
          else
            search_by_user_id
          end
        else
          exit
        end
    else
      puts 'Invalid input. Try again.'
      return_to_main_menu
    end
end

def search_by_movie_id
  puts 'Please choose from the following options'
  puts '(1) Find all ratings'
  puts '(2) Find average ratings'
  puts '(3) Find movie title'
  @second_user_input = gets.chomp
  if !%w(1 2 3).include?(@second_user_input)
    puts 'Invalid input. Try again.'
    return_to_main_menu
  else
    if %w(1 2 3).include?(@second_user_input)
      acquire_movie_id
    end
  end
end

def acquire_movie_id
  print 'Please enter the movie ID number you would like to search: '
  @movie_id = gets.chomp
  if [*"1".."1682"].include?(@movie_id)
    read_data_files
  else
    acquire_movie_id
  end
end

def read_data_files
  puts 'One moment please...'
  if @second_user_input == '1' || @second_user_input == '2'
    @ratings_data = []
    CSV.foreach('data.txt', "r:ISO-8859-1") do |row|
      subarray = row[0].gsub(/\s+/, ',').split(',')
      @ratings_data << subarray
    end
  elsif @second_user_input == '3'
    @movie_data = []
    CSV.foreach('item.txt', "r:ISO-8859-1") do |row|
      subarray = row[0].gsub(/\|/, ',').split(',')
      @movie_data << subarray
    end
  else
    puts 'Invalid input. Try again.'
    read_data_files
  end
end

def search_by_user_id
  puts 'Would you like to find all of the ratings made by a user? Type \'Y\'.'
  user_input = gets.chomp.upcase
    if user_input == 'Y'
      complete_search_by_user_id
    else
      return_to_main_menu
    end
end

def complete_search_by_user_id
  print 'Please enter the user ID number you would like to search: '
  @user_id == gets.chomp
end

def main
  start_program
  prompt_user_search
  if @first_user_input == '1'
    if @second_user_input == '1'
      rating = Rating.new
      rating.retrieve_ratings_movie_id(@ratings_data, @movie_id)
      return_to_main_menu
    elsif @second_user_input == '2'
      rating = Rating.new
      rating.average_rating(@ratings_data, @movie_id)
      return_to_main_menu
    else
      movie = Movie.new
      movie.find_title(@movie_data, @movie_id)
      return_to_main_menu
    end
  else
    user = Rating.new
    user.retrieve_ratings
  end
end

main if __FILE__ == $PROGRAM_NAME
