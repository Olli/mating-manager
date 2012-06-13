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
    user ||= User.new # guest user (not logged in)

    # at first the less privileged role so it should be possible
    # to inherit rights and write less code
    if user.has_role? :deliverer
      # deliverer can read apiary if its enabled
      can :read, MatingApiary, enabled: true
      # deliverer can see all active and archived fatherlines
      can :read, FatherLine, state: ['active','archived']
      can :read, MatingUnit
      can :read, Place
      # a deliverer can create his own apiary
      can :create, MatingApiary, user: user
    end
    if user.has_role? :manager, user.mating_apiary
      # manager can manage his apiary
      can :manage, user.mating_apiary, user: user
      # manager can create a new fatherline
      can :create, FatherLine, mating_apiary: user.mating_apiary
      # manager can update his own inactive fatherlines
      can :update, FatherLine, mating_apiary: user.mating_apiary, state: 'inactive'
      can :update, FatherLine, mating_apiary: user.mating_apiary, state: 'active'
    end
    if user.has_role? :admin
      can :manage, :all
      can :access, :rails_admin

    end
  end
end
