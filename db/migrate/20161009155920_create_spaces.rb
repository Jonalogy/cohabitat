class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.integer :user_id
      t.integer :country_id
      t.integer :area_id
      t.text :address
      t.integer :postal
      t.string :space_name
      t.text :space_description
      t.integer :space_type_id
      t.integer :vibe_id
      t.integer :amenity_id
      t.integer :listing_id
      t.decimal :price

      t.timestamps
    end
  end
end
