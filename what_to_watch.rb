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
  first_user_input = gets.chomp
  if !%w(1 2).include?(first_user_input)
    puts 'Invalid input. Try again.'
    prompt_user_search
  else
    if first_user_input == '1'
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
    else
      puts 'Invalid input. Try again.'
      conduct_search_by
    end
end

def search_by_movie_id
  puts 'Please choose from the following options'
  puts '(1) Find all ratings'
  puts '(2) Find average ratings'
  puts '(3) Find movie title'
  second_user_input = gets.chomp
  if !%w(1 2 3).include?(second_user_input)
    return_to_main_menu
  else
    if %w(1 2 3).include?(second_user_input)
      if second_user_input == '1'
        all_ratings = Rating.new
        all_ratings.acquire_movie_id
        all_ratings.retrieve_ratings
      elsif second_user_input == '2'
        rating = Rating.new
        rating.acquire_movie_id
        rating.average_ratings
      else
        movie = Movie.new
        movie.acquire_movie_id
      end
    else
      puts 'Invalid input. Try again.'
      search_by_movie_id
    end
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
  @user = User.new
  @user.read_user_data_file
  @user.retrieve_ratings
end

def main
  start_program
  prompt_user_search
end

main if __FILE__ == $PROGRAM_NAME
