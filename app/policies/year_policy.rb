class YearPolicy < ApplicationPolicy
  def new?
    user.admin?
  end
end
