class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(booker: user)
    end
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

  def announcer_pending?
    true
  end
end
