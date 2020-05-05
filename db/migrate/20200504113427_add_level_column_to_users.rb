class AddLevelColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :level, :integer, null: false, default: 1
  end
end
