class CreateJoinTableAmenitySpace < ActiveRecord::Migration[5.0]
  def change
    create_join_table :amenities, :spaces do |t|
      # t.index [:amenity_id, :space_id]
      # t.index [:space_id, :amenity_id]
    end
  end
end
