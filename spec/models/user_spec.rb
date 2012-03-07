require 'spec_helper'

describe User do
  it "should add a group to its owned groups" do
    group = Factory.create(:group)
    user = Factory.create(:user)
    user.add_to_owned_groups(group)

    user.owned_groups.include?(group).should be_true
  end
end
