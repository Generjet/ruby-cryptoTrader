# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # == Admin ===
    if user.admin?
      can :manage, :all
    else
      can [:read, :create], ItAsset
      can [:read, :create], User
      can [:read, :create], AssetsMovement
      can [:read, :create], AssetsOwner
    end

    # === IT engineer ===
    # can [:read, :create], ItAsset
    # can [:read, :create], User
    # can [:read, :create], AssetsMovement

    #   # can :read, Request, active: true, user_id: user.id
    #   # can :manage, Request, user_id: user.id
    #   can [:read,:create, :update], Request, user_id: user.id # зөвхөн өөрсдийн үүсгэсэнээ өөрчлөх боломжтой set
    #   can :show, Annex
    # can :read, Post, public: true

    # return unless user.present?  # additional permissions for logged in users (they can read their own posts)
    # can :read, Post, user: user

    # return unless user.admin?  # additional permissions for administrators
    # can :read, Post

    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
