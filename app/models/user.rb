class User < ApplicationRecord
  validates :name, presence: true, length:{maximum: 50}
  VALD_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:{maximum: 252}, format:{with: VALD_EMAIL_REGEX}

end
