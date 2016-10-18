class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
