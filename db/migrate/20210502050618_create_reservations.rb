class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :location
      t.string :service
      t.datetime :date
      t.string :user

      t.timestamps null: false
    end
  end
end
