Given /^the following user exists:$/ do |credentials|
  # table is a Cucumber::Ast::Table
  # pending # express the regexp above with the code you wish you had
  attributes = credentials.hashes[0]
  @user = Factory.create(
            :user,
            :email    => attributes['email'],
            :password => attributes['password'],
            :password_confirmation => attributes['password']
            )
end