class Workspace < ActiveRecord::Base
  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

  def owner
    memberships.select{ |m| m.is_owner }[0] || User.new
  end
end
