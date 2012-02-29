require 'spec_helper'

feature "Groups:" do
    background do
      @user = FactoryGirl.create(:user)

      @group_a = FactoryGirl.create(:group, :name => "Group A")
      @group_b = FactoryGirl.create(:group, :name => "Group B")
      @group_c = FactoryGirl.create(:group, :name => "Group C")

      @group_a.members << @user
      @group_b.members << @user

      visit new_user_session_path
      fill_in       'user_email',    :with => @user.email
      fill_in       'user_password', :with => @user.password
      click_button  'Sign in'
    end

    scenario "View groups list and show groups where User is a member" do
      visit groups_path

      [@group_a, @group_b].each do |group|
        page.should have_content(group.name)
        page.should have_content(group.description)
      end

      page.should_not have_content(@group_c.name)
      page.should_not have_content(@group_c.description)
    end

    scenario "View a group where User is not a member" do
      visit group_path(@group_c)
      current_path.should == groups_path
      page.should have_content('Access denied')
    end
end