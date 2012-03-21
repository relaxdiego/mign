#==========================
# WHENs
#==========================
When /^(?:he|she) tries to create the following ticket in that workspace:$/ do |table|
  @new_ticket_attrs = table.hashes[0]
  visit new_workspace_ticket_path(@workspace)
  fill_in 'ticket_subject', :with => @new_ticket_attrs['Subject']
  click_button 'Create Ticket'
end

When /^(?:he|she) tries to create a ticket in that workspace$/ do
  @new_ticket_attrs = Factory.build(:ticket).attributes
  visit new_workspace_ticket_path(@workspace)
  fill_in 'ticket_subject', :with => @new_ticket_attrs['subject']
  click_button 'Create Ticket'
end

#==========================
# THENs
#==========================
Then /^the ticket should be created under the workspace$/ do
  @ticket = get_ticket(@new_ticket_attrs['Subject'])
  @ticket.workspace.attributes.should == @workspace.attributes
end

Then /^the ticket should not be created$/ do
  @ticket = get_ticket(@new_ticket_attrs['Subject'])
  @ticket.should be_nil
end