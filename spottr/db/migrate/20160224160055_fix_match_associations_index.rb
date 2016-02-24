class FixMatchAssociationsIndex < ActiveRecord::Migration
  def change
  	remove_foreign_key :match_associations, :matches
  	add_foreign_key :match_associations, :users, column: :match_id
  end
end
