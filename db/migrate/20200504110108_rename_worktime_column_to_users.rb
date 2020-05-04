class RenameWorktimeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :worktime, :totaltime
  end
end
