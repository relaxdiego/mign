require 'spec_helper'

describe Workspace do
  it "should add a user to its members" do
    workspace = Factory.create(:workspace)
    user = Factory.create(:user)
    workspace.add_member(user)

    workspace.members.include?(user).should be_true
  end

  it "should only add a user to members once" do
    workspace = Factory.create(:workspace)
    user = Factory.create(:user)
    workspace.add_member(user)

    workspace.members.find(:all, user).length.should == 1
  end

  it "should remove a user from its members" do
    workspace = Factory.create(:workspace)
    user = Factory.create(:user)
    workspace.add_member(user)
    workspace.remove_member(user)

    workspace.members.include?(user).should be_false
  end

  it "should not raise an error when a user being removed is not a member" do
    workspace = Factory.create(:workspace)
    user = Factory.create(:user)

    workspace.remove_member(user).should be_true
  end
end
