#==========================
# GIVENs
#==========================

Given /^the following user exists:$/ do |credentials|
  attributes = credentials.hashes[0]
  @user = Factory.create(
            :user,
            :email    => attributes['email'],
            :password => attributes['password'],
            :password_confirmation => attributes['password']
            )
end

#==========================
# WHENs
#==========================

When /^(?:he|she) logs in using the correct credentials$/ do
  visit new_user_session_path
  fill_in       'user_email',    :with => @user.email
  fill_in       'user_password', :with => @user.password
  click_button  'Sign in'
end

When /^he attempts to access (.+) which is a secure page$/ do |page|
  visit eval("#{page}_path")
end

#==========================
# THENs
#==========================

Then /^(?:he|she) should be redirected to (?:his|her) home page$/ do
  current_path.should == root_path
end

Then /^he should be redirected to the log in page$/ do
  current_path.should == new_user_session_path
end
