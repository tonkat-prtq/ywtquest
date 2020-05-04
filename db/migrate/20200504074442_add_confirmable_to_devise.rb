class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  def up
    add_index :users, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    execute("UPDATE users SET confirmed_at = NOW()")
  end
  def down
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
