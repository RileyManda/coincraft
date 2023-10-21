class Category < ApplicationRecord
  has_many :transactions
  has_many :users, through: :transactions
  has_and_belongs_to_many :transactions, join_table: 'transaction_categories'

  validates :name, presence: true
  validates :icon, presence: true
end