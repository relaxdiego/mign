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

Given /^a user exists$/ do
  @user = Factory.create(:user)
end

Given /^(?:he|she) has an (?:officemate|teammate) named (.+)$/ do |name|
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

