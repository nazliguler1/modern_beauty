class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :category
      t.string :location
      t.integer :rating
      t.integer :price
      t.datetime :date
      t.string :user

      t.timestamps null: false
    end
  end
end
