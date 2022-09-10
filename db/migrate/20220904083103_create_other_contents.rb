class CreateOtherContents < ActiveRecord::Migration[6.1]
  def change
    create_table :other_contents do |t|
      t.integer :genre_id
      t.string :title
      t.string :release_date
      t.timestamps
    end
  end
end
