#==========================
# GIVENs
#==========================
Given /^(.+) is a member of the (.+) workspace$/ do |user_name, workspace_name|
  @user = get_user(user_name)
  @workspace = get_workspace(workspace_name)
  @workspace.add_member(@user)
end

Given /^(.+) is not a member of the (.+) workspace$/ do |user_name, workspace_name|
  @user = get_user(user_name)
  @workspace = get_workspace(workspace_name)
  @workspace.remove_member(@user)
end

#==========================
# WHENs
#==========================

When /^(?:he|she) tries to make (.+) a member of said workspace$/ do |name|
  new_member = get_user(name)
  visit new_membership_path

  if page.has_field? 'membership_user_id'
    fill_in 'membership_workspace_id', :with => @workspace.id
    fill_in 'membership_user_id', :with => new_member.id
    click_button 'Create Membership'
  end
end


#==========================
# THENs
#==========================

Then /^(?:he|she) will be an owner of that workspace$/ do
  @user.owned_workspaces.include?(@workspace).should be_true
end

Then /^(.+) will be a member of that workspace$/ do |name|
  new_member = get_user(name)

  new_member.workspaces.include?(@workspace).should == true
end