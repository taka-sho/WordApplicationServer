class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user && user.administrator?
      can :access, :rails_admin
      can :manage, :all
    end
  end
end
