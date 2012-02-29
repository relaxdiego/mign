require 'spec_helper'

feature 'Items:' do
    background do
      @user = FactoryGirl.create(:user)
    end

    scenario 'User not logged in' do
      visit items_path

      current_path.should == new_user_session_path
      pending 'Page should have the content in locales/devise.en.yml devise.failure.authenticated'
      pending 'Page should display the login form'
    end

    scenario 'List items' do
      visit new_user_session_path
      pending 'Log in'
      pending 'Visit lists index'
      pending 'Open one of the lists'
      pending 'Page should display all items in the list'
    end
end