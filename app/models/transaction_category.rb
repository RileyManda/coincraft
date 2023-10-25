class TransactionCategory < ApplicationRecord
  self.table_name = 'transaction_categories'
  belongs_to :transaction_record, class_name: 'Transaction', foreign_key: 'transaction_id'
  belongs_to :category
end
