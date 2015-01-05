class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)

    if user.present?
      if user.role? :admin
        can :manage, :all
      end

      if user.role? :forum_admin
        can :read, :all
        cannot [:new, :create], Forum
        can :manage, Tag
        can :manage, Forum, :id => user.forum.id
        can :manage, Topic, :forum_id => user.forum.id
        can :manage, Comment, :topic_id => user.forum.topics.map(&:id)
      end

      unless user.roles.present?
        can :read, :all
        can [:new, :create], Comment
        can [:new, :create], Forum
      end
    else
      can :read, :all
    end


  end
end
