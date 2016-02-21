class CreateMatchAssociations < ActiveRecord::Migration
  def change
    create_table :match_associations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :match, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
