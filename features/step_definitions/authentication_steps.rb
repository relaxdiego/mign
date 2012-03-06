When /^(?:he|she) logs in using the correct credentials$/ do
  visit new_user_session_path
  fill_in       'user_email',    :with => @user.email
  fill_in       'user_password', :with => @user.password
  click_button  'Sign in'
end

Then /^(?:he|she) should be redirected to the groups page$/ do
  current_path.should == groups_path
endThen /^(?:he|she) should be redirected to (?:his|her) home page$/ do
  current_path.should == root_path
end
