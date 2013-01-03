class Authlogic < ActiveRecord::Migration
  def up
    change_table "users" do |t|
      t.remove :password
      t.string :email, :crypted_password, :password_salt
      t.string :persistence_token, :null => false, :default => ""
      t.integer :login_count, :null => false, :default => 0
      t.integer :failed_login_count, :null => false, :default => 0
      t.datetime :last_login_at
      t.string :last_login_ip
    end
  end

  def down
   change_table "users" do |t|
      t.string :password
      t.remove :email, :crypted_password, :password_salt, :persistence_token
      t.remove :login_count
      t.remove :failed_login_count
      t.remove :last_login_at
      t.remove :last_login_ip
    end
  end
end
