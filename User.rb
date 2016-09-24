# User class - see rspec for further details.
require '../movie_lens'

class User < MovieLens



  def sort_by_age
    ObjectSpace.each_object(User).sort
    @age.sort
  end

  def is_similar?
  end

end
