# frozen_string_literal: true

class PrincipalsController < ApplicationController
  before_action :find_principal, only: %i[show edit update]

  after_action :verify_authorized, except: :index

  def update
    if @principal.update(principal_params)
      redirect_to @principal
    else
      render :edit
    end
  end

  private

  def find_principal
    @principal = Principal.find(params[:id])

    authorize @principal
  end

  def principal_params
    params.require(:principal).permit(:email, :password, :name, :age, :nation, :sex, :avatar,
      :salary, :work_rating)
  end
end
