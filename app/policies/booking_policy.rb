class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def update?
    # record.user == user
    user_is_owner?
  end

  def destroy?
    # record.user == user
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end
end
