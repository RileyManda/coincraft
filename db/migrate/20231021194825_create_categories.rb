class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon


      t.timestamps
    end
    add_reference :transactions, :category, foreign_key: true, index: true
  end
end