class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  attr_accessible :date, :description, :title

  before_save :check_date

  scope :empty, where(:date => nil)
  scope :older_than, lambda { |date| where("created_at > ?", date)}
  scope :interesting, lambda {
    joins(:comments).where("comments.text IS NOT NULL")
  }

  validates_length_of :description, :minimum => 5

  # default_scope :not_empty, where(:date => !nil)
  # before_validation :check_description
  # attr_readonly :social_security_number

  def description
    read_attribute(:description) || "n/a"
  end

  def check_date
    self.date ||= Date.today
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
