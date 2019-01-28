class User < ApplicationRecord
  # method from bcrypt gem
  has_secure_password
end
