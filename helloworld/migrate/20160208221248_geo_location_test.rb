class GeoLocationTest < ActiveRecord::Migration
  def self.up
  	create_table :geolocation do |t|
  		t.column :ortho_loc :text
  		t.column :address :text
  		t.column :city, :string, :limit => 32, :null => false
  		t.column :zip, :text
  		t.column :g_lat, :float
  		t.column :g_lon, :float
  		t.column :g_type, :text
  		t.column :g_side, :text
  		t.column :gap, :text
  		t.column :note, :text
  end
end
