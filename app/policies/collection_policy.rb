# frozen_string_literal: true
class CollectionPolicy < ApplicationPolicy
  def destroy?
    record.user == user
  end
end
