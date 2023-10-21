class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true, index: true
      t.references :category, foreign_key: true, index: true
      t.string :name
      t.decimal :amount
      t.datetime :created_at

      t.timestamps
    end

    add_index :transactions, :user_id
  end
end
