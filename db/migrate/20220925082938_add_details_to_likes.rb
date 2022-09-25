class AddDetailsToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :other_content_id, :integer
    add_column :likes, :movie_id, :integer
  end
end
