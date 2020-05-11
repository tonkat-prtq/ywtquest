class CreateCategorizedLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :categorized_logs do |t|
      t.integer :category_id, null: :false
      t.integer :log_id, null: :false

      t.timestamps
    end
  end
end
