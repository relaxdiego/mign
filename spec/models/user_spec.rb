require 'spec_helper'

describe User do
  it "should add a group to its owned groups" do
    workspace = Factory.create(:workspace)
    user = Factory.create(:user)
    user.add_to_owned_workspaces(workspace)

    user.owned_workspaces.include?(workspace).should be_true
  end
end
