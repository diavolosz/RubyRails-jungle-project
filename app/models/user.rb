class User < ApplicationRecord

  has_secure_password

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validate :passwords_match
  validates :password, presence: true, length: { minimum: 8}

  def self.authenticate_with_credentials(email, password)
    # get user and make lowercase 
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  private
    def passwords_match
      if password != password_confirmation
        errors.add(:password_confirmation, "password confirmation must be the same as password")
      end
    end

end
