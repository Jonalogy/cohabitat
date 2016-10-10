class CreateShouts < ActiveRecord::Migration[5.0]
  def change
    create_table :shouts do |t|
      t.integer :user_id
      t.integer :space_id
      t.text :message

      t.timestamps
    end
  end
end
