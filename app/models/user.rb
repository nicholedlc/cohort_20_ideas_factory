class User < ApplicationRecord
  has_secure_password

  has_many :ideas

  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
