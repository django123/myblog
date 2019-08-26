class AuthenticateUser

  prepend SimpleCommand
  attr_accessor :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private


  # verify user credentials
  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    errors.add :user_authentication, 'Invalid credentials'
    nil
  end
end