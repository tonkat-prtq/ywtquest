class RemoveHashStringFromLogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :hash_string, :string
  end
end
