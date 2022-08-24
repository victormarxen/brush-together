class ToothbrushPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.announcer == user
  end

  def destroy?
    record.announcer == user
  end
end
