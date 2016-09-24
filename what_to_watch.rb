require '../movie_lens'

def start_program
  puts 'Are you bored? Unsure of what to do with all your free time?'
  puts "Why not watch a movie? Don't worry, we'll make the decision for you!"
  puts 'How would you like to conduct your search?'
end

def prompt_user_search
  puts 'Please choose from the following options'
  puts '(1) Search by movie ID number.'
  puts '(2) Search by user ID'
  @user_input = gets.chomp
  if !%w(1 2).include?(@user_input)
    puts 'Invalid input. Try again.'
    prompt_user_search
  end
end

def search_by_movie_id
  if @user_input == 1
    puts 'Please choose from the following options'
    puts '(1) Find all ratings'
    puts '(2) Find average ratings'
    puts '(3) Find movie title'
    @user_input = gets.chomp
    if !%w(1..3).include?(@user_input)
      puts 'Would you like to go back to the main menu options? Type \'Y\'.'
      @user_input = gets.chomp.upcase
        if @user_input == 'Y'
          prompt_user_search
        else
          puts 'Invalid input. Try again.'
          search_by_movie_id
    elsif

    else


  end
  else
    puts 'Would you like to search all ratings made by a user?'

end

def main
  start_program
  prompt_user_search
  search_by_movie_id
end

main if __FILE__ == $PROGRAM_NAME
