require '../movie_lens'

def start_up
  puts 'Are you bored? Unsure of what to do with all your free time?'
  puts "Why not watch a movie? Don't worry, we'll make the decision for you!"
  puts 'How would you like to conduct your search?'
end

def prompt_user_search
  puts 'Please choose from the following options'
  puts '(1) Search by movie ID number.'
  puts '(2) Search by user ID'
  number = gets.chomp
  if !%w(1 2).include?(number)
    puts 'Invalid input. Try again.'
    prompt_user_search
  else
    if number == 1
      number = @movie_id
    else
      number = @user_id
  end
end

def search_for

  puts 'Please choose from the following options'
  Find all ratings for a movie by id
Find the average rating for a movie by id
Find the name of a movie by id
Find all ratings for a user
end

def main
  start_up
  prompt_user_search
  search_for
end

main if __FILE__ == $PROGRAM_NAME
