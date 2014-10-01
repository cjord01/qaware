class Api::BeaconsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def update
    beacon = Beacon.find_by(minor: params[:minor_id])
    beacon.update!(employee_id: params[:employee_id])
    head :ok
  end

  def destroy
    beacon = Beacon.find_by(minor: params[:minor_id])
    beacon.update!(employee_id: nil)
    head :ok
  end
end

# TEST ENTER REGION
=begin
curl -XPUT -H "Content-Type: application/json" "localhost:3000/api/beacons" -d '
{
  "minor_id": "2",
  "employee_id": "1"
}'
=end

# TEST EXIT REGION
=begin
curl -XDELETE -H "Content-Type: application/json" "localhost:3000/api/beacons" -d '
{
  "minor_id": "2",
  "employee_id": "1"
}'
=end

# TEST ENTER REGION on HEROKU
=begin
curl -XPUT -H "Content-Type: application/json" "http://qaware.herokuapp.com/api/beacons" -d '
{
  "minor_id": "2",
  "employee_id": "1"
}'
=end

# TEST EXIT REGION on HEROKU
=begin
curl -XDELETE -H "Content-Type: application/json" "http://qaware.herokuapp.com/api/beacons" -d '
{
  "minor_id": "2",
  "employee_id": "1"
}'
=end