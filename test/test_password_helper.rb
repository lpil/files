require 'bcrypt'

module TestPasswordHelper
  def default_password_digest
    BCrypt::Password.create(default_password)
  end

  def default_password
    'the_default-password'
  end
end
