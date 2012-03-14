#==========================
# GIVENs
#==========================

#==========================
# WHENs
#==========================

When /^(?:he|she) tries to add (.+) as a member to (?:her|that) workspace$/ do |name|
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