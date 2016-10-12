class User < ApplicationRecord
  before_save :default_profile_image
  # has_many :likes
  # has_many :spaces, through :likes
  has_many :spaces, dependent: :destroy
  has_many :shouts, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true, on: :create #length: { in: 8..72 },
  validates :password_confirmation, presence: true, on: :create #length: { in: 8..72 },

  def self.authenticate(params)
  User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end

  def default_profile_image
    self.profile_img_url ||= "http://res.cloudinary.com/dgiqrtq7k/image/upload/v1476276809/default-profile-pic_ftkuhp.png"
  end

end
