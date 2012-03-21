#==========================
# GIVENs
#==========================
Given /^[Aa] workspace named (.+) exists$/ do |workspace_name|
  @workspace = Factory.create(:workspace, :name => workspace_name)
  @old_workspace_attr_values = @workspace.attributes
end

Given /^(?:[Hh]e|[Ss]he) owns a workspace named (.+)$/ do |workspace_name|
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

  if page.has_field? 'workspace_name'
    fill_in 'workspace_name', :with => @new_workspace_attr_values[:name]
    fill_in 'workspace_description', :with => @new_workspace_attr_values[:description]
    click_button 'Update Workspace'
  end
end

#==========================
# THENs
#==========================

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
