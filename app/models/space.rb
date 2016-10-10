class Space < ApplicationRecord
  # has_many :likes
  # has_many :users, through:likes
  has_many  :shouts
  has_many :images
end
