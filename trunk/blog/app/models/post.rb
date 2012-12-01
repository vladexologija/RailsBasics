class Post
  attr_accessor :id

  def initialize(id)
    @id = id
  end

  def to_param
    "ovo je proba".parameterize
  end
end
