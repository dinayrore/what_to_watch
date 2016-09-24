require '../Movie'
require 'CSV'

describe Movie do

  it 'creates an object within the Movie class' do
    # Arrange
    movie_variable = Movie.new('movie_title_string')
    # Assert
    expect(movie_variable).to be_a(Movie)
  end

  it 'recalls a Movie class object title' do
    # Arrange
    movie_variable = Movie.new('movie_title_string')
    # Act
    result_variable = movie_variable.title
    # Assert
    expect(result_variable).to eq 'movie_title_string'
  end

  it 'acquire movie ID from movie title' do
    # Arrange
    movie_title = Movie.new('Birdcage, The')
    # Act
    result_variable = movie_title.acquire_movie_id
    # Assert
    expect(result_variable).to eq '25'
  end

  it 'acquire movie title from movie ID' do
    # Arrange
    movie_id = Movie.new('25')
    # Act
    movie_title = movie_id.acquire_title_from_id
    # Assert
    expect(movie_title).to eq 'Birdcage, The'
  end

  it 'receive all ratings for a Movie object' do
    # Arrange
    movie_id = Movie.new('25')
    # Act
    result_variable = movie_id.recieve_ratings
    # Assert
    expect(result_variable.count).to eq 293
  end

  it 'aquire average rating for Movie object' do
    # Arrange
    movie_title = Movie.new('Birdcage, The')
    # Act
    sum = 0
    movie_ratings.each { |rating| sum += rating }
    average_rating = (((sum.to_f)/(movie_ratings.count.to_f))
    # Assert
    expect(average_rating).to eq 3.4 
  end
end
