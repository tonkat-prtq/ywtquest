class AddLogRefToKnowledges < ActiveRecord::Migration[5.2]
  def change
    add_reference :knowledges, :log, foreign_key: true
  end
end
