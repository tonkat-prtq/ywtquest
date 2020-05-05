class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.date :started_on, null: false, default: -> { 'NOW()' }
      t.date :ended_on

      t.timestamps
    end
  end
end
