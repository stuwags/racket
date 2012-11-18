class AddLikesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :likes, :text
    add_column :users, :movies, :text
    add_column :users, :music, :text
    add_column :users, :books, :text
    add_column :users, :locations, :text
  end
end
