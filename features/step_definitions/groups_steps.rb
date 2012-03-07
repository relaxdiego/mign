When /^(?:he|she) creates a group named '(.+)'$/ do |group_name|
  visit new_group_path
  fill_in 'group_name', :with => group_name
  click_button 'Create Group'

  @group = Group.find_by_name(group_name)
  @group.should_not be_nil
end

Then /^(?:he|she) will be an owner of that group$/ do
  @user.owned_groups.include?(@group).should be_true
end