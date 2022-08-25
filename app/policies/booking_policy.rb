class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def all_renters?
    true
  end

  def show?
    record.user == user || record.gear.user == user
  end

  def new?
    create?
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    record.user == user || record.gear.user == user
  end
end
