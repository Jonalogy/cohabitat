class Space < ApplicationRecord
  # has_many :likes
  # has_many :users, through:likes
  has_many :availabilities
  has_many :bookings
end
