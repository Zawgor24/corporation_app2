# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_path, notice: 'You do not have access to this page'
  end

  def pundit_user
    if principal_signed_in?
      current_principal
    elsif manager_signed_in?
      current_manager
    elsif taskmaster_signed_in?
      current_taskmaster
    elsif
      current_employee
    end
  end
end
