class User < ApplicationRecord

  validates :email, uniqueness: true, presence: true, email: true

  has_secure_password

end