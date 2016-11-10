class ChapterPolicy < ApplicationPolicy
  def index?
    user
  end

  def show?
    true
  end

  def new?
    user and (user.role.admin? or user.role.author?)
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def destroy?
    user and user.id == record.user_id
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
