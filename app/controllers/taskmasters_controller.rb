# frozen_string_literal: true

class TaskmastersController < ApplicationController
  before_action :find_taskmaster, only: %i[show edit update destroy]
  before_action :find_workshop, only: %i[create new index]

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @taskmasters = policy_scope(@workshop.taskmasters.all).reverse
  end

  def new
    @taskmaster = Taskmaster.new

    authorize @taskmaster
  end

  def create
    @taskmaster = @workshop.taskmasters.create(taskmaster_params)
    authorize @taskmaster

    if @taskmaster.save
      WorkMailer.sample_email(@taskmaster, params[:taskmaster][:password]).deliver_now
      redirect_to @taskmaster
    else
      render :new
    end
  end

  def update
    if @taskmaster.update(taskmaster_params)
      redirect_to @taskmaster
    else
      render :edit
    end
  end

  def destroy
    @taskmaster.destroy

    redirect_to root_path
  end

  private

  def find_taskmaster
    @taskmaster = Taskmaster.find(params[:id])

    authorize @taskmaster
  end

  def find_workshop
    @workshop = Workshop.find(params[:workshop_id])
  end

  def taskmaster_params
    params.require(:taskmaster).permit(:email, :password, :name, :age, :nation, :sex, :avatar,
      :salary, :work_rating, :workshop_id)
  end
end
