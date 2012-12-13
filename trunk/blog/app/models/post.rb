class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  attr_accessible :date, :description, :title

  # before_validation :check_description
  # attr_readonly :social_security_number

  def description
    read_attribute(:description) || "n/a"
  end

  # set_table_name to use different table name than default - plural of model
  #def to_param
  #  description.parameterize
  #end

  # remove sware words before typecasting
  # def check_description
  #  self[:description] = description_before_type_cast.gsub(/fuck/i,"*")
  # end

end
