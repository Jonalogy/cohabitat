class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.integer :space_id
      t.date :start
      t.date :end
      t.integer :seat
      t.decimal :seat_price
      t.boolean :active

      t.timestamps
    end
  end
end
