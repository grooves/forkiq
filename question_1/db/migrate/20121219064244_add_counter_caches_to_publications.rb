class AddCounterCachesToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :concerns_count, :integer
    add_column :publications, :publication_comments_count, :integer
  end
end
