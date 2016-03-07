class CreateGeolocs < ActiveRecord::Migration
  def change
    create_table :geolocs do |t|
   	  t.float :latitude
      t.float :longitude
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
