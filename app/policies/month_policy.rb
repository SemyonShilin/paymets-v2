class MonthPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
end
