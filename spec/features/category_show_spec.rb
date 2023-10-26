require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
    create(:category, name: 'Groceries', user:)
  end

  scenario 'User views category name' do
    visit categories_path
    expect(page).to have_content('Groceries')
  end

  scenario 'User views category name' do
    visit categories_path
    category_name = 'Groceries'
    expect(page).to have_content(category_name)
  end

  scenario 'User views individual transactions' do
    category = create(:category, name: 'Example Category', user:)
    transaction1 = create(:transaction, name: 'Transaction 1', amount: 5000, category:)
    transaction2 = create(:transaction, name: 'Transaction 2', amount: 7500, category:)

    visit category_path(category)
    expect(page).to have_content(transaction1.name)
    expect(page).to have_content("$#{transaction1.amount}")
    expect(page).to have_content(transaction2.name)
    expect(page).to have_content("$#{transaction2.amount}")
  end
end
