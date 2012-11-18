class CreateServes < ActiveRecord::Migration
  def change
    create_table :serves do |t|

      t.string :name
      t.text :comment
      t.integer :from_user_id
      t.integer :to_user_id
      t.string :to_facebook_ids
      t.boolean :hit
      t.boolean :miss

      t.timestamps
    end
  end
end
