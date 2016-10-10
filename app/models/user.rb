class User < ApplicationRecord
  has_many :likes
  has_many :spaces, through :likes
end


@likes = spaces.likes.all
@likes.length
