# spec/models/transaction_spec.rb
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John', email: 'john@example.com', password: 'password')
    category = Category.create(name: 'Example Category', icon: 'icon', user_id: user.id)
    transaction = Transaction.new(name: 'Example Transaction', amount: 100.0, category:)
    expect(transaction).to be_valid
  end

  it 'is not valid without a name' do
    user = User.create(name: 'John', email: 'john@example.com', password: 'password')
    transaction = Transaction.new(amount: 100.0, author_id: user.id)
    expect(transaction).not_to be_valid
  end

  it 'is not valid without an amount' do
    user = User.create(name: 'John', email: 'john@example.com', password: 'password')
    transaction = Transaction.new(name: 'Example Transaction', author_id: user.id)
    expect(transaction).not_to be_valid
  end

  it 'is not valid without an author (user)' do
    transaction = Transaction.new(name: 'Example Transaction', amount: 100.0)
    expect(transaction).not_to be_valid
  end
end
