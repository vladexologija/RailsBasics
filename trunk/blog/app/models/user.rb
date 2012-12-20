class User < ActiveRecord::Base
  has_many :posts
  accepts_nested_attributes_for :posts

  attr_accessible  :username,
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
  validates_format_of :username , :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_inclusion_of :role, :in => ["admin", "user", "guest"]
  validates_length_of :password, :minimum => 5
  validates_uniqueness_of :username

  before_destroy :prevent_destroy

  def prevent_destroy
    update_attribute(:updated_at, Time.now)
    false
  end

end
