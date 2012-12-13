class UpdateComments < ActiveRecord::Migration
  def up
    change_table :comments do |t|
      t.change :text, :text
      t.column :username, :string
      t.column :title, :string
      t.remove :account
    end
  end

  def down
    # just for testing
    raise ActiveRecord::IrreversibleMigration
  end
end
