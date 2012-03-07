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

Given /^(?:he|she) is logged in$/ do
  login_with :email => @user.email, :password => @user.password
end

Given /^(?:he|she) successfully logged in after being redirected from (.+)$/ do |page|
  visit eval("#{page}_path")
  login_with :email => @user.email, :password => @user.password
end

Given /^a user is logged in$/ do
  steps %{
    Given the following user exists:
      | email                | password    |
      | relaxdiego@gmail.com | passw0rd111 |
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

Then /^(?:he|she) will be redirected to (.+)$/ do |page_alias|
  current_path.should == if page_alias == 'home' || page_alias =~ /(?:his|her|the) home page/
                           root_path
                         elsif page_alias == 'login' || page_alias =~ /the (?:login|log in|log-in) page/
                           new_user_session_path
                         else
                           raise "unknown page alias: #{page_alias}"
                         end
end

Then /^the system will display (.+)$/ do |message|
  page.should have_content(message)
end

Then /^(?:he|she) will be redirected back to the (.+)$/ do |page|
  current_path.should == eval("#{page}_path")
end