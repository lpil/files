class User < ActiveRecord::Base
  # Default scope

  # Constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # attr macros

  # Validations

  validates :name,
    presence: true,
    length: { maximum: 30 }

  password_length_message = 'Passwords must be at least 8 characters long' 
  validates :password,
    presence: true,
    length: { minimum: 8,
              message: password_length_message },
    on: :create
  # Password validation for future updates
  # We allow nil values, because we don't always want to have to enter the
  # password every time we change a user attribute. Especially if it is an
  # admin making the changes- they won't know the password
  validates :password,
    presence: true,
    length: { minimum: 8,
              message: password_length_message },
    allow_nil: true,
    on: :update

  validates :password_confirmation,
    presence: true,
    on: :create

  validates :email,
    presence:   true,
    format:     { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  # Callbacks

  before_save { self.email = email.downcase }

  has_secure_password
end
