class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy # Articles is plural since a user can create many articles. dependent means that if the user becomes invalid or the user gets destroyed, then all associated articles will follow the method shown (:destroy) 
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 } # Check that username exists (presence) and has a minimum length of 3 and a maximum length of 25 characters.
  VALID_EMAIL_REGEX = /\A[^\._-][\w\.-]+[^\.]@[^\.][a-z\d\.-]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end