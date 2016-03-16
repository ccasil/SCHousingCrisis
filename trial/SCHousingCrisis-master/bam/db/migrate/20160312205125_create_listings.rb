class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :phone
      t.text :email
      t.string :street
      t.string :city
      t.string :state
      t.text :zip
      t.integer :priceperm
      t.float :latitude
      t.float :longitude
      t.text :description
      t.attachment :photo

      t.timestamps null: false
    end
  end
end
