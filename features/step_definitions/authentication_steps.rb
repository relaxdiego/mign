#==========================
# GIVENs
#==========================

Given /^(?:[Hh]e|[Ss]he) is logged in$/ do
  login_with :email => @user.email, :password => @user.password
end

Given /^[Aa] user named (.+) is logged in$/ do |name|
  steps %{
    Given the following user exists:
      | first_name | email                | password       |
      | #{name}    | relaxdiego@gmail.com | as4943dladdsf  |
    And she is logged in
  }
end

Given /^(?:[Hh]e|[Ss]he) successfully logged in after being redirected from (.+)$/ do |page|
  visit eval("#{page}_path")
  login_with :email => @user.email, :password => @user.password
end

#==========================
# WHENs
#==========================

When /^(?:he|she) logs in with the following credentials: (.*), (.*)$/ do |email, password|
  login_with :email => email, :password => password
end

When /^(?:he|she) attempts to access (.+) without logging in first$/ do |page|
  visit eval("#{page}_path")
end

When /^(?:he|she) visits the log in page$/ do
  visit new_user_session_path
end

When /^(?:he|she) tries to log out$/ do
  click_on 'logout'
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