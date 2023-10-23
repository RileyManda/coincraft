class Category < ApplicationRecord
  has_many :transaction_categories
  has_many :transactions, through: :transaction_categories,source: :transaction_record
  validates :name, presence: true
  validates :icon, presence: true
end
