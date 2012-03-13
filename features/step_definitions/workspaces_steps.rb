#==========================
# GIVENs
#==========================
Given /^a workspace named (.+) exists$/ do |workspace_name|
  @workspace = Factory.create(:workspace, :name => workspace_name)
  @old_workspace_attr_values = @workspace.attributes
end

Given /^(?:he|she) owns a workspace named (.+)$/ do |workspace_name|
  step "a workspace named #{workspace_name} exists"
  @user.add_to_owned_workspaces(@workspace)
end

#==========================
# WHENs
#==========================
When /^(?:he|she) creates a workspace named (.+)$/ do |workspace_name|
  visit new_workspace_path
  fill_in 'workspace_name', :with => workspace_name
  click_button 'Create Workspace'

  @workspace = Workspace.find_by_name(workspace_name)
  @workspace.should_not be_nil
end

When /^(?:he|she) tries to edit the workspace with the following attributes:$/ do |table|
  @new_workspace_attr_values = table.hashes[0]
  visit edit_workspace_path(@workspace)
  if has_field?('workspace_name')
    fill_in 'workspace_name', :with => @new_workspace_attr_values[:name]
    fill_in 'workspace_description', :with => @new_workspace_attr_values[:description]
    click_button 'Update Workspace'
  end
end

When /^(?:he|she) tries to add (.+) to her workspace$/ do |name|
  new_member = get_user(name)

  visit edit_workspace_path(@workspace)
  fill_in 'membership_user_id', :with => new_member.id
  click_button 'Create Membership'
end

#==========================
# THENs
#==========================
Then /^(?:he|she) will be an owner of that workspace$/ do
  @user.owned_workspaces.include?(@workspace).should be_true
end

Then /^the workspace will be updated accordingly$/ do
  @workspace.reload
  @new_workspace_attr_values.keys.each do |key|
    @workspace[key].should == @new_workspace_attr_values[key]
  end
end

Then /^the workspace will not be updated$/ do
  @workspace.reload
  @new_workspace_attr_values.keys.each do |key|
    @workspace[key].should_not == @new_workspace_attr_values[key]
    @workspace[key].should     == @old_workspace_attr_values[key]
  end
end

Then /^(.+) will be a member of that workspace$/ do |name|
  new_member = get_user(name)

  new_member.workspaces.include?(@workspace).should == true
  pending # express the regexp above with the code you wish you had
end