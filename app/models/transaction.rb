class Transaction < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :category
  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :author_id, presence: true
end
