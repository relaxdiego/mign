#==========================
# GIVENs
#==========================

Given /^[Aa] user is logged in$/ do
  @user = create_user
  login @user
end

Given /^[Aa] user named (.+) is logged in$/ do |name|
  @user = create_user(:first_name => name)
  login @user
end

Given /^(?:[Hh]e|[Ss]he) successfully logged in after being redirected from (.+)$/ do |page|
  visit eval("#{page}_path")
  login @user
end

#==========================
# WHENs
#==========================

When /^someone attempts to log in with the following credentials: (.*), (.*)$/ do |email, password|
  visit new_user_session_path
  fill_in       'user_email',    :with => email
  fill_in       'user_password', :with => password
  click_button  'login'
end

When /^(?:he|she|someone) attempts to access (.+) without logging in first$/ do |page|
  visit eval("#{page}_path")
end

When /^(?:he|she) visits the log in page$/ do
  visit new_user_session_path
end

When /^(?:he|she) tries to log out$/ do
  click_on 'logout'
end

When /^(?:he|she) logs in$/ do
  fill_in       'user_email',    :with => @user.email
  fill_in       'user_password', :with => @user.password
  click_button  'login'
end

#==========================
# THENs
#==========================

Then /^(?:he|she) should be logged out$/ do
  # Need to improve this. There should be a better
  # way to tell that the user is logged out. Maybe
  # check the sessions database??
  page.should have_no_selector('#logout')
end

Then /^the system should display '(.+)'$/ do |message|
  page.should have_content(message)
end

Then /^he should see the log in page$/ do
  page.should have_field('user_email')
  page.should have_field('user_password')
end