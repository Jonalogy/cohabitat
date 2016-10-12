class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :space_id
      t.integer :availability_id
      t.date :start
      t.date :end
      t.integer :seat
      t.decimal :total_price, precision: 13, scale: 2

      t.timestamps
    end
  end
end
