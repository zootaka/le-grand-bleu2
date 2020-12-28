class CreateMapPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :map_places do |t|
      t.string :place_name,  null: false, unique: true
      t.text   :description
      t.float  :latitude,  null: false
      t.float  :longitude, null: false
      t.timestamps
    end
    add_index :map_places, :place_name
  end
end
