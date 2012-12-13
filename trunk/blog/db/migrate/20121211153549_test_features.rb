class TestFeatures < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.belongs_to :post
      t.column :text, :string
      t.column :account, :string
      # adds created_at and updated_at columns (maintained by ActiveRecord)
      t.timestamps
    end

  end

  def down
    drop_table :comments
  end
end
