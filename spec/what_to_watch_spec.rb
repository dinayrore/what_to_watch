require '../Movie'
require '../User'
require '../Ratings'

require 'CSV'
CSV.foreach('movie_data/demographics.txt') do |row|
  puts row
end

describe Movie do
  # before do
  #   @movie = Movie.new
  # end

  it 'intialize'  do
    # Arrange  - create an instance variable

    # Act - what it does?

    # Assert - result

  end


end
