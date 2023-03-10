class User < ApplicationRecord
  # gives user model authentication methods via bcrypt
  has_secure_password
end
