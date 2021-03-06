class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.integer :space_id
      t.date :start
      t.date :end
      t.integer :seat
      t.decimal :seat_price, precision: 13, scale: 2
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
