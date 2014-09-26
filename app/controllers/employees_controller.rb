class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @manager = Manager.first
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
    end
  end

  private
    def employee_params
      params.require(:employee).permit(
        :manager_id,
        :name,
        :email
      )
    end
end
