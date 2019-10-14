# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    end
    if user
      can :crud, Room, user_id: user.id
    end
  end
end
