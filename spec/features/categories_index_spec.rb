require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { create(:user) }

  scenario 'User creates a new category' do
    visit new_category_path
    fill_in 'Name', with: 'Groceries'
    fill_in 'Icon', with: '🛒'
    click_button 'Create Category'
    expect(page).to have_content('Groceries')
    expect(page).to have_content('🛒')
  end

  scenario 'User views a list of categories' do
    create(:category, name: 'Groceries', icon: '🛒', user: user)
    create(:category, name: 'Travel', icon: '✈️', user: user)

    visit categories_path
    expect(page).to have_content('Groceries')
    expect(page).to have_content('Travel')
  end
end