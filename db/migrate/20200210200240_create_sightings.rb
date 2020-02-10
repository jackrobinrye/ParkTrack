class CreateSightings < ActiveRecord::Migration[6.0]
  def change
    create_table :sightings do |t|
      t.datetime :date
      t.integer :user_id
      t.integer :park_id
      t.integer :species_id

      t.timestamps
    end
  end
end
