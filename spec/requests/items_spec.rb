require 'spec_helper'

feature "Items" do
    background do
      Item.create!(:subject => 'Item one')
      Item.create!(:subject => 'Item two')
    end

    scenario "Items index" do
      visit "/items"
      page.should have_content('Item one')
      page.should have_content('Item two')
    end
end