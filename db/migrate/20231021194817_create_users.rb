class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps
    end
    add_reference :transactions, :user, foreign_key: true, index: true
  end
end
