#==========================
# GIVENs
#==========================

#==========================
# WHENs
#==========================

When /^someone tries to register with (.*), (.*), (.*), (.*), and (.*)$/ do |first_name, last_name, email, password, password_confirmation|
  data = {
    :first_name            => first_name,
    :last_name             => last_name,
    :email                 => email,
    :password              => password,
    :password_confirmation => password_confirmation
  }

  @page = RegistrationPage.visit
  data.each do |field_id, value|
    @page.fill_in field_id, value
  end
  @page.submit
end

#==========================
# THENs
#==========================

Then /^the registration should Succeed$/ do
  WorkspacesPage.new.should_be_current
end

Then /^the registration should Fail$/ do
  WorkspacesPage.new.should_not_be_current
end