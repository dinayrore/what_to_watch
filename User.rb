# User class

class User
  attr_reader :user_id, :age, :gender

  def initialize(user_id, age, gender)
    @user_id = user_id
    @age = age
    @gender = gender
  end

  def sort_by_age
    ObjectSpace.each_object(User).sort
    @age.sort
  end

  def is_similar?
  end

end
