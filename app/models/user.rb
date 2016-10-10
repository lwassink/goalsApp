class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :username, uniqueness: true

  after_initialize :ensure_session_token

  has_many :goals

  has_many :comments,
  class_name: :UserComment

  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save
    self.session_token
  end

  def self.find_by_credentials(username, password)
    user = self.find_by_username(username)
    if user && user.is_password?(password)
      return user
    end
    nil
  end

  def is_password?(password)
    bco = BCrypt::Password.new(self.password_digest)
    bco.is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
