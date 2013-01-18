class Comment < ActiveRecord::Base
  belongs_to :post, :touch => true
  attr_accessible :text, :title, :username, :post_id
end
