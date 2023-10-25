class Category < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :transaction_categories
  has_many :transactions
  validates :name, presence: true
  validates :icon, presence: true
end
