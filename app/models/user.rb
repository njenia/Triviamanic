class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  has_secure_password

  has_many :questions
  has_many :quizzes
  before_save :create_remember_token

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
