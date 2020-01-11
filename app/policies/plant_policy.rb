class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    # anyone can view any plant

    # display only the plants of owner
    # scope.where(user: user)
    end
  end

  # not anyone can create a plant. removes link to create a plant from index
  def new?
    create?
  end

  # anyone can create a plant. I think this is not correct! Only Host's can?
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
