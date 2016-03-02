class CreateGeolocs < ActiveRecord::Migration
  def change
    create_table :geolocs do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.float :g_lat
      t.float :g_lon
      t.string :g_side
      t.string :g_type
      t.string :g_side

      t.timestamps null: false
    end
  end
end
