class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :category
      t.string :location
      t.string :rating
      t.string :price

      t.timestamps null: false
    end
  end
end
