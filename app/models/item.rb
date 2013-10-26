class Item < ActiveRecord::Base
  has_secure_password

  validates :content, presence: true
  validates :password,              presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true, length: { minimum: 4 }

  scope :active, -> { where("expires_at > ?", Time.now) }
end
