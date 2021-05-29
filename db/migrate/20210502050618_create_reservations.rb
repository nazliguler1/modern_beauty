class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.datetime :date
      t.string :service_name
      t.string :service_location
#      t.integer :user_id
#      t.integer :service_id
#      t.belongs_to :user, index: true, foreign_key: true
#      t.belongs_to :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
