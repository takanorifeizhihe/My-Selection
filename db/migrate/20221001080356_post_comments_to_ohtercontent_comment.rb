class PostCommentsToOhtercontentComment < ActiveRecord::Migration[6.1]
  def change
    rename_table :post_comments, :othercontent_comments
  end
end
