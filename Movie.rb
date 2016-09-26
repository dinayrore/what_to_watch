# Movie class - see rspec for further details.
require 'pry'

class Movie
  def initialize(*_)
    @movie_id = *_
    @movie_title = *_
  end

  def find_title(movie_data, movie_id)
    @movie_title = nil
    movie_data.each do |subarray|
      if movie_id == subarray[0]
        @movie_title = subarray[1]
      end
    end
      puts "The movie ID number #{movie_id} is entitled #{@movie_title}."
  end

  def find_movie_id(movie_data)
    @movie_id = nil
    movie_data.each do |subarray|
      if @movie_title == subarray[1]
        movie_id << subarray[0]
      end
    end
    puts "The movie entitled #{@movie_title} has the movie ID number #{movie_id}."
  end
end
