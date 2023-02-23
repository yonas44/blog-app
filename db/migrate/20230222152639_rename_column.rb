class RenameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :posts_count, :posts_counter
    rename_column :posts, :likes_count, :likes_counter
    rename_column :posts, :comments_count, :comments_counter
  end
end
