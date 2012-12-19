class AddIndexToUserSkilltags < ActiveRecord::Migration
  def change
    add_index :user_skilltags, [:user_id, :skilltag_id]
  end
end
