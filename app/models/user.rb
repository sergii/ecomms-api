class User < ApplicationRecord
  validates_presence_of :email, :password_digest
  validates :email, uniqueness: true

  # Encrypt password
  has_secure_password
end
