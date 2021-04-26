class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin?
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end
  
  def destroy?
    if index?
      if user.id == record.id
        raise Pundit::NotAuthorizedError, I18n.t('.pundit.delete_self')
      elsif User.all.size == 1 && User.where(admin: true).size == 1
        raise Pundit::NotAuthorizedError, I18n.t('.pundit.admin_last')
      else
        true
      end
    else
      false
    end
  end

  def show?
    index?
  end

end
