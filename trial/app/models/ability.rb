class Ability
  include CanCan::Ability
  def initialize(user)
    if user
    user ||= User.new 
    can :read, :all
    can :create, :all
    can :destroy, :all, :user_id => user.id
    can :update, :all, :user_id => user.id
    can :upvote, :all
    
    
   else
    can :read, :all
    can :create, :all
   end
end
end