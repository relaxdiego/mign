#==========================
# GIVENs
#==========================

Given /^(?:he|she) is logged in$/ do
  login_with :email => @user.email, :password => @user.password
end

Given /^a user named (.+) is logged in$/ do |name|
  steps %{
    Given a user exists
    And she is logged in
  }
end

Given /^(?:he|she) successfully logged in after being redirected from (.+)$/ do |page|
  visit eval("#{page}_path")
  login_with :email => @user.email, :password => @user.password
end

Given /^a user is logged in$/ do
  steps %{
    Given the following user exists:
      | email      | password |
      | a@user.com | 123qweqq |
     And he is logged in
  }
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

#==========================
# THENs
#==========================

