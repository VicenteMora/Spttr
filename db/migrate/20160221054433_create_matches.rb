class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.boolean :isRejected

      t.timestamps null: false
    end
  end
end
