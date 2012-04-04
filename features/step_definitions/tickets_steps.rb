#==========================
# GIVENs
#==========================

Given /^That workspace has the following tickets$/ do |table|
  tickets = table.hashes

  tickets.each do |ticket|
    attrs = {}
    attrs[:workspace_id] = @workspace.id
    attrs[:subject] = ticket['Subject']
    attrs[:points] = ticket['Points'] if ticket['Points']
    Factory.create(:ticket, attrs)
  end
end

#==========================
# WHENs
#==========================
When /^(?:he|she) tries to create a ticket in that workspace$/ do
  @new_ticket_attrs = Factory.build(:ticket).attributes
  visit workspace_path(@workspace)

  if page.has_field? 'ticket_subject'
    fill_in 'ticket_subject', :with => @new_ticket_attrs['subject']
    click_on 'create_ticket'
  end
end

#==========================
# THENs
#==========================
Then /^the ticket should be created under that workspace$/ do
  @ticket = get_ticket(@new_ticket_attrs['Subject'])
  @ticket.workspace.attributes.should == @workspace.attributes
end

Then /^the ticket should not be created$/ do
  @ticket = get_ticket(@new_ticket_attrs['Subject'])
  @ticket.should be_nil
end

Then /^(?:he|she) will see the following tickets$/ do |table|
  tickets = table.hashes

  tickets.each do |ticket|
    page.should have_content(ticket['Subject'])
  end
end