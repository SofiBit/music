# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    end
    if user.present?
      can :manage, Playlist, user_id: user.id
      can :read, Playlist do |playlist|
        playlist.public?
      end
      can :read, Room do |room|
        room.users.include?(user)
      end
    end
  end
end
