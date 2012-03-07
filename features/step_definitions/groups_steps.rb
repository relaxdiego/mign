#==========================
# GIVENs
#==========================
Given /^a group named (.+) exists$/ do |group_name|
  @group = Factory.create(:group, :name => group_name)
  @old_group_attr_values = @group.attributes
end

Given /^(?:he|she) owns a group named (.+)$/ do |group_name|
  step "a group named #{group_name} exists"
  @user.add_to_owned_groups(@group)
end

#==========================
# WHENs
#==========================
When /^(?:he|she) creates a group named '(.+)'$/ do |group_name|
  visit new_group_path
  fill_in 'group_name', :with => group_name
  click_button 'Create Group'

  @group = Group.find_by_name(group_name)
  @group.should_not be_nil
end

When /^(?:he|she) tries to edit the group with the following attributes:$/ do |table|
  @new_group_attr_values = table.hashes[0]
  visit edit_group_path(@group)
  if has_field?('group_name')
    fill_in 'group_name', :with => @new_group_attr_values[:name]
    fill_in 'group_description', :with => @new_group_attr_values[:description]
    click_button 'Update Group'
  end
end

#==========================
# THENs
#==========================
Then /^(?:he|she) will be an owner of that group$/ do
  @user.owned_groups.include?(@group).should be_true
end

Then /^the group will be updated accordingly$/ do
  @group.reload
  @new_group_attr_values.keys.each do |key|
    @group[key].should == @new_group_attr_values[key]
  end
end

Then /^the group will not be updated$/ do
  @group.reload
  @new_group_attr_values.keys.each do |key|
    @group[key].should_not == @new_group_attr_values[key]
    @group[key].should     == @old_group_attr_values[key]
  end
end