# frozen_string_literal: true

class SubscriptionPolicy < ApplicationPolicy
  def create?
    record.user == user && user_confirmed?
  end

  def show_active_subscription?
    create?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
