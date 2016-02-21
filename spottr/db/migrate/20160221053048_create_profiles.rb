class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :gender,          :null => false, :default => "Male" 
      t.string :first_name
      t.string :last_name
      t.string :fitness_level,   :null => false, :default => "intermediate"
      t.string :gym
      t.string :availability,    :null => false, :default =>  "afternoon"
      t.references :user_id,      :index => true
      t.boolean :over_18
      t.string :headshot_url   

      t.timestamps null: false
    end
  end
end
