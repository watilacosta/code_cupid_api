# frozen_string_literal: true

class SubscriptionSerializer < Panko::Serializer
  attributes :id, :start_date, :end_date, :active, :plan_name

  def plan_name
    object.plan.name
  end
end