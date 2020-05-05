class CreateDones < ActiveRecord::Migration[5.2]
  def change
    create_table :dones do |t|
      t.string :title, null: false, default: ""
      t.text :comment, null: false, default: ""
      t.integer :worktime, null: false, default: 0

      t.timestamps
    end
  end
end
