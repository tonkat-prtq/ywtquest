class AddExpPointColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :exp_point, :integer, null: false, default: 0
  end
end
