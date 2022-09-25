class RemovePostIdFroLikes < ActiveRecord::Migration[6.1]
   def up
    remove_column :likes, :post_id
   end

  def down
    remove_column :likes, :post_id
  end
end
