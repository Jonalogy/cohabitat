class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :space_id
      t.string :url

      t.timestamps
    end
  end
end
