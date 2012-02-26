require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :subject => "MyString",
      :points => 1,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path, :method => "post" do
      assert_select "input#item_subject", :name => "item[subject]"
      assert_select "input#item_points", :name => "item[points]"
      assert_select "input#item_description", :name => "item[description]"
    end
  end
end
