# spec/models/category_spec.rb
require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John', email: 'john@example.com', password: 'password')
    category = Category.new(name: 'Example Category', icon: '🛒', user:)
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    user = User.create(name: 'John', email: 'john@example.com', password: 'password')
    category = Category.new(icon: '🛒', user:)
    expect(category).not_to be_valid
  end

  it 'is not valid without an icon' do
    user = User.create(name: 'John', email: 'john@example.com', password: 'password')
    category = Category.new(name: 'Example Category', user:)
    expect(category).not_to be_valid
  end
end
