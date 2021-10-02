class User < ApplicationRecord  
  validates :name, presence: true,
                   uniqueness: true,
                   length: { maximum: 30 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }  
end
