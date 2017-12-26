# frozen_string_literal: true

class PrincipalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    user_for_verification?(Principal)
  end

  def edit?
    user_for_verification?(Principal)
  end

  def update?
    user_for_verification?(Principal)
  end
end
