class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.integer :user_id, foreign_key: true
      t.integer :attraction_id, foreign_key: true
      t.boolean :can_ride, default: true
      
      t.timestamps
    end
  end
end
