When /^(?:he|she) creates a group named '(.+)'$/ do |group_name|
  visit new_group_path
  fill_in 'group_name', :with => group_name
  click_button 'Create Group'
end

Then /^(?:he|she) will be an owner of that group$/ do
  pending "need a way to check user ownership"
  # checking for ownership can be done via the CanCan gem
  # groups and users are already associated via membership.
  # the membership model just needs to be able to say
  # if the member is an owner of the group or not
end