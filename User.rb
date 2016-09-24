# User class - see rspec for further details.
require 'CSV'

class User
  def read_user_data_file
    puts 'One moment please...'
    @user_data = []
    CSV.foreach('user.txt') do |row|
      subarray = row.tr("|",", ").split(',')
      @movie_data << subarray
    end
  end

  # def sort_by_age
  #   ObjectSpace.each_object(User).sort
  #   @age.sort
  # end
  #
  # def is_similar?
  # end

end
