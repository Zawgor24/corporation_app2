# frozen_string_literal: true

class TaskmasterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    principal? || manager?
  end

  def show?
    user_for_verification?(Taskmaster) || manager? || principal?
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
end
