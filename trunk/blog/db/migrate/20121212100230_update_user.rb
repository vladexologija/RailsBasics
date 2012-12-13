class UpdateUser < ActiveRecord::Migration
  def up
    add_column :users, :repeat_passwod, :string
  end

  def down
    remove_column :users, :repeat_passwod
  end
end
