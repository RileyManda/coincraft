class CreateTransactionCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_categories do |t|
      t.bigint :transaction_id
      t.bigint :category_id

      t.timestamps
    end
    add_index :transaction_categories, [:transaction_id, :category_id], unique: true
  end
end
