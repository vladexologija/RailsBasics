class UpdatePosts < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.belongs_to :user
    end
  end

  def down
    remove_column :posts, :user_id
  end
end
