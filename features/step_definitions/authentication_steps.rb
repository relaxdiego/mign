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

Given /^he is logged in$/ do
  login_with :email => @user.email, :password => @user.password
end

Given /^he successfully logged in after being redirected from (.+)$/ do |page|
  visit eval("#{page}_path")
  login_with :email => @user.email, :password => @user.password
end

#==========================
# WHENs
#==========================

When /^(?:he|she) logs in using the correct credentials$/ do
  login_with :email => @user.email, :password => @user.password
end

When /^he attempts to access (.+) which is a secure page$/ do |page|
  visit eval("#{page}_path")
end

When /^he tries to login with these invalid credentials: (.*), (.*)$/ do |email, password|
  login_with :email => email, :password => password
end

When /^he visits the log in page$/ do
  visit new_user_session_path
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

Then /^the system should display '(.+)'$/ do |message|
  page.should have_content(message)
end

Then /^he should be redirected back to the (.+)$/ do |page|
  current_path.should == eval("#{page}_path")
end