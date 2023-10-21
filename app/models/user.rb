class User < ApplicationRecord
  has_many :transactions
  has_many :categories, through: :transactions

  validates :email, presence: true, uniqueness: true
end
