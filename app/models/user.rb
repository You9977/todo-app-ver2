class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: true,
                   length: { maximum: 30 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }  

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
