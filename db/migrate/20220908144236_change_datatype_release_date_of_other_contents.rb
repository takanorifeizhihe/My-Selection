class ChangeDatatypeReleaseDateOfOtherContents < ActiveRecord::Migration[6.1]
  def change
    change_column :other_contents, :release_date, :datetime
  end
end
