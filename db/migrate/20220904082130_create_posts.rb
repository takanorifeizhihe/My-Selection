class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :movie_id
      t.integer :other_content_id
      t.string :star
      t.string :comment


      t.timestamps
    end
  end
end
