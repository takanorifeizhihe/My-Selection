class RenamePostIdColumnToOthercontentComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :othercontent_comments, :post_id, :other_content_id
  end
end
