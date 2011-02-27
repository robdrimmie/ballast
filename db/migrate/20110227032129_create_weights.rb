class CreateWeights < ActiveRecord::Migration
  def self.up
    create_table :weights do |t|
      t.float :weight
      t.float :average
      t.integer :user_id

      t.timestamps
    end
    add_index :weights, :user_id
  end

  def self.down
    drop_table :weights
  end
end
