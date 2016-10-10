class Availability < ApplicationRecord
  belongs_to :space
  has_one :booking
end
