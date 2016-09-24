# Movie class - see rspec for further details.
require 'pry'
require 'CSV'

class Movie
  def read_movie_data_file
    puts 'One moment please...'
    @movie_data = []
    CSV.foreach('item.txt', "r:ISO-8859-1") do |row|
      subarray = row[0].gsub(/\|/, ',').split(',')
      @movie_data << subarray
    end
    movie = Movie.new
    movie.find_title(@movie_data)
    binding.pry
  end

def acquire_movie_id
  print 'Please enter the movie ID number you would like to search: '
  movie_id = gets.chomp.to_i
  if [*1..1682].include?(!movie_id)
    acquire_movie_id
  else
  movie = Movie.new
  movie.read_movie_data_file
  end
end

  def find_title(movie_data)
      @movie_data.each do |subarray|
        if movie_id == subarray[0]
          movie_title = subarray[1]
        end
        print "#{movie_title} belongs to #{movie_id}."
      end
  end

  def find_movie_id
    movie_id = []
    @movie_data.each do |subarray|
      if @movie_title == subarray[1]
        movie_id << subarray[0]
      end
    end
    print movie_id
  end
end
