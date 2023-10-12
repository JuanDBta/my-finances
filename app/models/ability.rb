# frozen_string_literal: true

# app/models/ability.rb
# Generate the 'ability' file.
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    can :splash, :all
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can :read, :all

      # Add more specific abilities as needed.
      can :create, Category
      can :update, Category, user_id: user.id
      can :destroy, Category, user_id: user.id

      can :create, Operation
      can :update, Operation, user_id: user.id
      can :destroy, Operation, user_id: user.id
    end
  end
end
