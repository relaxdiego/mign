class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :memberships
  has_many :groups, :through => :memberships
  has_many :owned_groups,
           :through => :memberships,
           :source => :group,
           :conditions => ['memberships.is_owner = ?', true]

  def add_to_owned_groups(group)
    owned_groups << group
    membership = memberships.find(:first, :conditions => ['group_id = ?', group.id])
    membership.is_owner = true
    membership.save!
  end
end
