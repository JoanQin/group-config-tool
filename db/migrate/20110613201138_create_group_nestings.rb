class CreateGroupNestings < ActiveRecord::Migration
  def self.up
    create_table :group_nestings do |t|
      t.integer :parent_id
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :group_nestings
  end
end
