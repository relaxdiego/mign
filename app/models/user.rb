class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :memberships
  has_many :workspaces, :through => :memberships
  has_many :owned_workspaces,
           :through => :memberships,
           :source => :workspace,
           :conditions => ['memberships.is_owner = ?', true]

  def add_to_owned_workspaces(workspace)
    owned_workspaces << workspace
    membership = memberships.find(:first, :conditions => ['workspace_id = ?', workspace.id])
    membership.is_owner = true
    membership.save!
  end
end
