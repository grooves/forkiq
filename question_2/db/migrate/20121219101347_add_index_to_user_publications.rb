class AddIndexToUserPublications < ActiveRecord::Migration
  def change
    add_index :user_publications, [:user_id, :publication_id]
  end
end
