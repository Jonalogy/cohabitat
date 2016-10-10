class User < ApplicationRecord
  has_and_belongs_to_many :spaces

  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true, on: :create #length: { in: 8..72 },
  validates :password_confirmation, presence: true, on: :create #length: { in: 8..72 },

  def self.authenticate(params)
  User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end

end
