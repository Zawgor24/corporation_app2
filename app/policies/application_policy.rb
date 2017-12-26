# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end

  private

  def user_for_verification?(worker)
    user.is_a?(worker) && user == record
  end

  def principal?
    user.is_a?(Principal)
  end

  def manager?
    user.is_a?(Manager)
  end

  def taskmaster?
    user.is_a?(Taskmaster)
  end

  def employee?
    user.is_a?(Employee)
  end
end
