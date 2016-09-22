class User < ActiveRecord::Base
  attr_reader :password
  has_many :posts
  # validates_uniqueness_of :username
  # validates_presence_of :username, :password, :password_confirmation
  # def password=(unencrypted_password)
  #   unless unencrypted_password.empty?
  #     @password = unencrypted_password
  #     self.password_digest = BCrypt::Password.create(unencrypted_password)
  #   end
  # end
  #
  # def authenticate(unencrypted_password)
  #   if BCrypt::Password.new(self.password_digest) == unencrypted_password
  #     return self
  #   else
  #     return false
  #   end
  # end
  has_secure_password

end
