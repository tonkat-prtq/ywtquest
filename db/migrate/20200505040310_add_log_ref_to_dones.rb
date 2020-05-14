class AddLogRefToDones < ActiveRecord::Migration[5.2]
  def change
    add_reference :dones, :log, foreign_key: true
  end
end
