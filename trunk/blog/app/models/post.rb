class Post < ActiveRecord::Base
  attr_accessible :date, :description, :title

  # set_table_name to use different table name than default - plural of model
  def to_param
    "ovo je proba".parameterize
  end

end
