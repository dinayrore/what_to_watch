# Movie class - see rspec for further details.
require 'CSV'

class Movie
  def read_movie_data_file
    puts 'One moment please...'
    movie_data = []
    CSV.foreach('item.txt') do |row|
      subarray = row[0].gsub(/\|/, ",").split(',')
      movie_data << subarray
      find_title(movie_data)
    end
  end

  def find_title(movie_data)
    movie_title = []
    movie_data.each do |subarray|
      if @movie_id == subarray[0]
        movie_title << subarray[1]
      end
      print movie_title
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
