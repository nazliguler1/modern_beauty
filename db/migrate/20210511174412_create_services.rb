class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :category
      t.string :location
      t.integer :rating
      t.integer :price

      t.timestamps null: false
    end
  end
end
