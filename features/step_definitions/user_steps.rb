#==========================
# GIVENs
#==========================

Given /^[Aa] user exists$/ do
  @user = create_user
end

Given /^[Aa] user with the following credentials exists:$/ do |credentials|
  @user = create_user(credentials.hashes[0])
end

Given /^(?:[Hh]e|[Ss]he) has an (?:officemate|teammate) named (.+)$/ do |name|
  Factory.create(:user, :first_name => name, :email => "#{name}@email.com")
  other_user = User.find_by_first_name(name)
  other_user.should_not be_nil
end

#==========================
# WHENs
#==========================


#==========================
# THENs
#==========================

