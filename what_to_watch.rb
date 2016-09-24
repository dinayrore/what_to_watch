def read_movie_data
  require 'CSV'
  @movie_data = []
  CSV.foreach('movie_data/u.data') do |row|
    subarray = row[0].gsub(/\s+/, ',').split(',')
    @movie_data << subarray
  end
end



def main

end

main if __FILE__ == $PROGRAM_NAME
