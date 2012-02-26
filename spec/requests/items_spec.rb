require 'spec_helper'

feature "Items" do
    background do
      @item1 = FactoryGirl.create(:item, :subject => 'Item one')
      @item2 = FactoryGirl.create(:item, :subject => 'Item two')
    end

    scenario "Items index" do
      visit "/items"
      page.should have_content(@item1.subject)
      page.should have_content(@item2.subject)
    end
end