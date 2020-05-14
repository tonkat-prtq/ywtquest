class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title, null: false, default: ""
      t.text :comment, null: false, default: ""
      t.date :when_to_do

      t.timestamps
    end
  end
end
