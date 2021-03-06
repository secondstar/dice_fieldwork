class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    # user ||= User.new # guest user (not logged in)
    if user && user.is_admin?
      can :access, :rails_admin # needed to access RailsAdmin
      can :dashboard              # grant access to the dashboard
      can :manage, :all
    end
    
    if user && user.is_sales_rep?
      can :access, :rails_admin # needed to access RailsAdmin
      can :dashboard              # grant access to the dashboard
      can :read, [Calendar, User]
      can :manage, [Account, Address, Note, Service, Consultation]
      # can :read, :all
      
      # can :create, Account
      # can :update, Account do |account|
      #   account.try(:user) == user.is_sales_rep?
      # end
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
