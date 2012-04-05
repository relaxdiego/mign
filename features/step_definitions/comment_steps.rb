#==========================
# GIVENs
#==========================


#==========================
# WHENs
#==========================

When /^(?:he|she) tries to add a comment to the ticket$/ do
  visit ticket_path(@ticket)
  @new_comment_attrs = Factory.attributes_for(:comment)

  fill_in  'comment_subject', :with => @new_comment_attrs[:subject]
  fill_in  'comment_body',    :with => @new_comment_attrs[:body]
  click_on 'create_comment'
end

#==========================
# THENs
#==========================

Then /^the comment will be appended to the ticket$/ do
  @ticket.reload
  @comment = get_comment(@new_comment_attrs[:subject])
  @comment.should_not be_nil
  @comment.ticket.attributes.should == @ticket.attributes
end