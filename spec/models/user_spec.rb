require 'spec_helper'

describe User do
  it "should add a group to its owned groups" do
    workspace = Factory.create(:workspace)
    user = Factory.create(:user)
    user.add_to_owned_workspaces(workspace)

    user.owned_workspaces.include?(workspace).should be_true
  end

  it "should validate presence of first_name" do
    user = User.new(:first_name => nil)
    user.should_not be_valid
    user.should have(1).error_on(:first_name)
  end
end
