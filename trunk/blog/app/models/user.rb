class User < ActiveRecord::Base
  has_many :posts
  accepts_nested_attributes_for :posts

  acts_as_authentic

  attr_accessible  :email,
                   :username,
                   :password,
                   :password_confirmation,
                   :preferences,
                   :role,
                   :terms_of_service,
                   :posts_attributes

  attr_accessor :role

  serialize :preferences, Hash

  validates_acceptance_of :terms_of_service, :message => "just click the button"
  validates_confirmation_of :password
  validates_inclusion_of :role, :in => ["admin", "user", "guest"]
  validates_length_of :password, :minimum => 5
  validates_uniqueness_of :username

  validates :email, :presence => true, :uniqueness => true, :email_format => true

  #before_destroy :prevent_destroy

  #def prevent_destroy
  #  update_attribute(:updated_at, Time.now)
  #  false
  #end

end
