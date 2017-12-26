# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :find_employee, only: %i[show edit update destroy]
  before_action :find_taskmaster, only: %i[create new index]

  def index
    @employees = @taskmaster.employees.all

    authorize @employees
  end

  def new
    @employee = Employee.new

    authorize @employee
  end

  def create
    @employee = @taskmaster.employees.create(employee_params)
    authorize @employee

    if @employee.save
      WorkMailer.sample_email(@employee, params[:employee][:password]).deliver_now
      redirect_to @employee
    else
      render :new
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy

    redirect_to root_path
  end

  private

  def find_employee
    @employee = Employee.find(params[:id])

    authorize @employee
  end

  def find_taskmaster
    @taskmaster = Taskmaster.find(params[:taskmaster_id])
  end

  def employee_params
    params.require(:employee).permit(:email, :password, :name, :age, :nation, :sex, :avatar,
      :salary, :work_rating, :taskmaster_id)
  end
end
