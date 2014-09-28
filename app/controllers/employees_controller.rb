class EmployeesController < ApplicationController

  def index
    if session[:manager_id]
      @employees = Employee.all
    else
      redirect_to root_path
    end
  end

  def new
    if session[:manager_id]
      @employee = Employee.new
      @manager = Manager.find(session[:manager_id])
    else
      redirect_to root_path
    end
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
