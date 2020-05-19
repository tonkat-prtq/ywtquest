class AddHashStringColumnToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :hash_string, :string
  end
end
