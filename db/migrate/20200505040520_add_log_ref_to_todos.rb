class AddLogRefToTodos < ActiveRecord::Migration[5.2]
  def change
    add_reference :todos, :log, foreign_key: true
  end
end
