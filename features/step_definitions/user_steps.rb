#==========================
# GIVENs
#==========================

Given /^[Tt]he following user exists:$/ do |credentials|
  attributes = credentials.hashes[0]
  @user = Factory.create(
            :user,
            :email    => attributes['email'],
            :password => attributes['password'],
            :password_confirmation => attributes['password'],
            :first_name => attributes['first_name'] || ''
            )
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

