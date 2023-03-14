class User < ApplicationRecord
  # gives user model authentication methods via bcrypt
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, :uniqueness => {:case_sensitive => false}
  validates :password, presence: true, length: {minimum: 3}, confirmation: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    emailSpaceRemoved = email.strip()
    # find_by_email
    user = User.find_by("LOWER(email)= ?", emailSpaceRemoved.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end

  end
end
