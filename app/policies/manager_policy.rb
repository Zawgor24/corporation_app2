# frozen_string_literal: true

class ManagerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    user_for_verification?(Manager) || principal?
  end

  def new?
    principal?
  end

  def create?
    principal?
  end

  def edit?
    principal?
  end

  def update?
    principal?
  end
end
