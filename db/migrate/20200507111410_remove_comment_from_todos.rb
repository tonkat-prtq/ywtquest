class RemoveCommentFromTodos < ActiveRecord::Migration[5.2]
  def change
    remove_column :todos, :comment, :text
  end
end
