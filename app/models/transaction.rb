class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :user_id, presence: true
  validates :category_id, presence: true
end
