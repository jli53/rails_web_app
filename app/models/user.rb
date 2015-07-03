class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  REGULAR_VALID_MAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: REGULAR_VALID_MAIL }, uniqueness:{case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: { minimum:6 }
end
