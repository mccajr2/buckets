class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      t.string :description
      t.integer :user_id

      t.timestamps
    end
    add_index :buckets, [:user_id, :created_at]
  end
end
