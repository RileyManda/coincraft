require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user  
    create(:category, name: 'Groceries', user: user)
    create(:category, name: 'Travel', user: user)
  end

  scenario 'User views a list of categories' do
    visit categories_path
    expect(page).to have_content('Groceries')
    expect(page).to have_content('Travel')
  end
end
