class RemoveRepeatPasswod < ActiveRecord::Migration
  def up
    remove_column :users, :repeat_passwod
  end

  def down
    remove_column :users, :repeat_passwod
  end
end
