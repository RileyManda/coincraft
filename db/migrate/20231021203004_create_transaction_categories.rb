class CreateTransactionCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_categories, id: false do |t|
      t.belongs_to :transaction
      t.belongs_to :category
    end

    add_index :transaction_categories, [:transaction_id, :category_id], unique: true
  end
end
