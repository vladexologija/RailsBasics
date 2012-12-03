class Post
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :id, :title, :description, :date

  def initialize(params = nil)
    if params
      @id = params[:id]
    end
  end

  def to_param
    "ovo je proba".parameterize
  end

  def persisted?
    false
  end

end
