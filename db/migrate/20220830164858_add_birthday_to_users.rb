class AddBirthdayToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birthday, :string, null: false
  end
end
