class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :street
      t.string :city
      t.float :zip
      t.string :gender
      t.float :rentPerMonth
      t.float :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
