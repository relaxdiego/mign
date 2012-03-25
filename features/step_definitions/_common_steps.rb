#==========================
# GIVENs
#==========================

#==========================
# WHENs
#==========================

#==========================
# THENs
#==========================
Then /^(?:he|she) will be redirected to (?:the|his) (.+) page$/ do |page_alias|
  current_path.should == if page_alias == 'home' || page_alias =~ /(?:his|her|the) home page/
                           root_path
                         elsif page_alias =~ /(?:login|log in|log-in)/
                           new_user_session_path
                         else
                           eval ("#{page_alias}_path")
                         end
end

Then /^the system will display '(.+)'$/ do |message|
  page.should have_content(message)
end