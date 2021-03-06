class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    can :create, Workspace
    can :manage, Workspace do |workspace|
      user.owned_workspaces.include?(workspace)
    end

    can :read, Workspace do |workspace|
      workspace.members.include?(user)
    end

    can :create, Membership do |membership|
      if membership.workspace_id.nil?
        # The user is trying to access the form
        true
      else
        user.owned_workspaces.include?(Workspace.find(membership.workspace_id))
      end
    end

    can :manage, Ticket do |ticket|
      if ticket.workspace_id.nil?
        true
      else
        ticket.workspace.members.include? user
      end
    end

    can :create, Comment do |comment|
      comment.ticket.workspace.members.include?(user)
    end
  end
end
