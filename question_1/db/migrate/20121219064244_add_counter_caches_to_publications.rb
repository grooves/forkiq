class AddCounterCachesToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :concerns_count, :integer, default: 0
    add_column :publications, :publication_comments_count, :integer, default: 0

    Publication.find_each do |pub|
      Publication.reset_counters pub.id, :concerns, :publication_comments
    end
  end
end
