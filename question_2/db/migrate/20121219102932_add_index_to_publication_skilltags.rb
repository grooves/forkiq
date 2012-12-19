class AddIndexToPublicationSkilltags < ActiveRecord::Migration
  def change
    add_index :publication_skilltags, [:publication_id, :skilltag_id]
  end
end
