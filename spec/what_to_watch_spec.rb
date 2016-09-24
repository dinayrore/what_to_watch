require '../movie_lens'

describe MovieLens do

  it 'reads existing file and retrieves movie IDs and titles' do
    # Arrange

    # Act

    # Assert

  end

  it 'reads existing file and retrieves user ID, movie ID, and ratings' do
    # Arrange

    # Act

    # Assert

  end

  it 'reads existing file and retrieves user IDs' do
    # Arrange

    # Act

    # Assert

  end

describe Movie do

  it 'calls on class, allows access to class methods' do
    # Arrange
    Movie.new
    # Assert
    expect(movie_variable).to be Movie
  end

  it 'find movie title from movie ID' do
    # Arrange
    movie_id = Movie.new('25')
    # Act
    movie_title = movie_id.find_title
    # Assert
    expect(movie_title).to eq 'Birdcage, The'
  end

  it 'find movie ID from movie title' do
    # Arrange
    movie_title = Movie.new('Birdcage, The')
    # Act
    result_variable = movie_title.find_movie_id
    # Assert
    expect(result_variable).to eq '25'
  end

end

describe Rating do

  it 'calls on class, allows access to class methods' do
    # Arrange
    Rating.new
    # Assert
    expect(Rating).to be Rating
  end

  it 'receive all ratings for a movie ID' do
    # Arrange
    movie_id = 25
    # Act
    result_variable = movie_id.retrieve_ratings
    # Assert
    expect(result_variable.count).to eq 293
  end

  it 'aquire average rating for a movie ID' do
    # Arrange
    movie_id = 25
    # Act
    result_variable = movie_id.retrieve_ratings.average_ratings
    # Assert
    expect(result_variable).to eq 3.4
  end

  it 'receive all ratings by user ID' do
    # Arrange
    movie_id = 25
    # Act
    result_variable = movie_id.retrieve_ratings
    # Assert
    expect(result_variable.count).to eq 293
  end

describe User do

  it 'calls on class, allows access to class methods' do
    # Arrange
    User.new
    # Assert
    expect(User).to be User
  end
