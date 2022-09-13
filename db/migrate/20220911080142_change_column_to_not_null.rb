class ChangeColumnToNotNull < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :birthday,:string, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :users, :birthday,:string, false
  end
end
