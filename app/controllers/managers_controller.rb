# frozen_string_literal: true

class ManagersController < ApplicationController
  before_action :find_manager, only: %i[show edit update destroy]
  before_action :find_workshop, only: %i[create new]

  after_action :verify_authorized, except: :index

  def new
    @manager = Manager.new

    authorize @manager
  end

  def create
    @manager = @workshop.create_manager(manager_params)
    authorize @manager

    if @manager.save
      WorkMailer.sample_email(@manager, params[:manager][:password]).deliver_now
      redirect_to @manager
    else
      render :new
    end
  end

  def update
    if @manager.update(manager_params)
      redirect_to @manager
    else
      render :edit
    end
  end

  def destroy
    @manager.destroy

    redirect_to root_path
  end

  private

  def find_manager
    @manager = Manager.find(params[:id])

    authorize @manager
  end

  def find_workshop
    @workshop = Workshop.find(params[:workshop_id])
  end

  def manager_params
    params.require(:manager).permit(:email, :password, :name, :age, :nation, :sex, :avatar,
      :salary, :work_rating, :workshop_id)
  end
end
