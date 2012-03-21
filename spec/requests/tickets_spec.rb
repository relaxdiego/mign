# require 'spec_helper'
#
# feature "Items" do
#     background do
#       @ticket1 = FactoryGirl.create(:item, :subject => 'Item one')
#       @ticket2 = FactoryGirl.create(:item, :subject => 'Item two')
#     end
#
#     scenario "Items index" do
#       visit "/items"
#       page.should have_content(@ticket1.subject)
#       page.should have_content(@ticket2.subject)
#     end
# end