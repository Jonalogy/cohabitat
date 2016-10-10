class Space < ApplicationRecord
  # has_many :likes
  # has_many :users, through:likes
<<<<<<< HEAD
  has_many  :shouts
=======
  has_many :availabilities
  has_many :bookings

  belongs_to :country
  belongs_to :area
  belongs_to :space_type
  belongs_to :user
  belongs_to :vibe
  has_and_belongs_to_many :amenities
  has_many  :shouts

>>>>>>> 16cefa9e01bf38c9772f65a88ebca7e41fa10286
end
