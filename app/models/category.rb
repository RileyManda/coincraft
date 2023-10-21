class Category < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions

  validates :name, presence: true
  validates :icon, presence: true
end