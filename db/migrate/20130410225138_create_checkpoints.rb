class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.string :description
      t.integer :bucket_id

      t.timestamps
    end
  end
end
