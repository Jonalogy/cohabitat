class Space < ApplicationRecord
  # has_many :likes
  # has_many :users, through:likes
  has_many :availabilities
  has_many :bookings

  belongs_to :country
  belongs_to :area
  belongs_to :space_type
  belongs_to :user
  belongs_to :vibe
  has_and_belongs_to_many :amenities
end
