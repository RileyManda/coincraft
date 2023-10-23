class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.string :name
      t.decimal :amount
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
