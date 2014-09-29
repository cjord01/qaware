class Api::SessionsController < ApplicationController
  def create
    # employee = Employee.find_by(name: params[:name])
    # if employee && employee.authenticate(params[:password])
    #   render json: employee.to_json
    # else
    #   401
    # end
    employee = Employee.find_by(name: params[:name])
    if employee
        render json: employee.to_json
    else
        401
    end
  end
end

# TEST
=begin
curl -XPOST -H "Content-Type: application/json" "localhost:3000/api/sessions" -d '
{
  "name": "brandon"
}'
=end