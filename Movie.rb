# Movie class - see rspec for further details.
require '../movie_lens'

class Movie < MovieLens

  def find_title
    movie_title = []
    @movie_data.each do |subarray|
      if @movie_id == subarray[0]
        movie_title << subarray[1]
      end
    end
  end

  def find_movie_id
    movie_id = []
    @movie_data.each do |subarray|
      if @movie_title == subarray[1]
        movie_id << subarray[0]
      end
    end
  end
end
