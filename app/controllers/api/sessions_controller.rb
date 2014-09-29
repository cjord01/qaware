class Api::SessionsController < ApplicationController
  def create
    # user = User.find_by(name: params[:name])
    # if user && user.authenticate(params[:password])
    #   render json: user.to_json
    # else
    #   401
    # end
    employee = Employee.first
    render json: employee.to_json
  end
end