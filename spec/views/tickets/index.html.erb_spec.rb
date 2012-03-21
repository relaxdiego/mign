require 'spec_helper'

describe "tickets/index" do
  before(:each) do
    assign(:tickets, [
      stub_model(Ticket,
        :subject => "Subject",
        :points => 1,
        :description => "Description"
      ),
      stub_model(Ticket,
        :subject => "Subject",
        :points => 1,
        :description => "Description"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
