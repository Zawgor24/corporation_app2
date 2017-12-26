# frozen_string_literal: true

module Accessible
  extend ActiveSupport::Concern

  included do
    before_action :check_user
  end

  protected

  def check_user
    if current_principal
      flash.clear
      redirect_to(root_path) && return
    elsif current_manager
      flash.clear
      redirect_to(root_path) && return
    end
  end
end
