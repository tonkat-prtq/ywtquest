class CreateKnowledges < ActiveRecord::Migration[5.2]
  def change
    create_table :knowledges do |t|
      t.string :title, null: false, default: ""
      t.text :comment, null: false, default: ""

      t.timestamps
    end
  end
end
