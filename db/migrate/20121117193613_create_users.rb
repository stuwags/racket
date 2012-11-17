class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :first_name
      t.string :last_name
      t.string :photo
      t.string :access_token
      t.string :facebook_id
      t.timestamps
    end
  end
end
