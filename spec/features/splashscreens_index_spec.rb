require 'rails_helper'

RSpec.feature "splash_screens#index", type: :feature do
  describe "Index page" do
    it "displays the application name and two buttons" do
      visit splash_screen_path
      expect(page).to have_content("CoinCraft")
      expect(page).to have_link("Sign In", href: new_user_session_path)
      expect(page).to have_link("Sign Up", href: new_user_registration_path)
    end
  end
end
