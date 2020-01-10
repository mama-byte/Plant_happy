class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      scope.where(user: user)
    end

    # def new?
    #   true
    #   # create?
    # end

    def create?
      true #anyone can create a plant. I think this is not correct! Only Host's can?
      # false
    end

    # temp edit method till full refactor
    def edit?
      record.user == user
    end

    def update?
      # record.user == user
      user_is_owner?
    end

    private

    def user_is_owner?
      record.user == user
    end
  end
end
