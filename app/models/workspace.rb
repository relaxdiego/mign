class Workspace < ActiveRecord::Base
  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

  def owner
    memberships.select{ |m| m.is_owner }[0] || User.new
  end

  def add_member(user)
    memberships.create(:user_id => user.id) unless members.include?(user)
  end

  def remove_member(user)
    memberships.delete(Membership.where(:user_id => user.id))
  end
end
