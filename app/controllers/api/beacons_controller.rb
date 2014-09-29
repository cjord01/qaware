class Api::BeaconsController < ApplicationController
  def update
    beacon = Beacon.find(params[:beacon_id])
    beacon.update!(employee_id: params[:employee_id])
    200
  end

  def destroy
    beacon = Beacon.find(params[:beacon_id])
    beacon.update!(employee_id: nil)
    200
  end
end

# TEST ENTER REGION
=begin
curl -XPUT -H "Content-Type: application/json" "localhost:3000/api/beacons" -d '
{
  "beacon_id": "2",
  "employee_id": "1"
}'
=end

# TEST EXIT REGION
=begin
curl -XDELETE -H "Content-Type: application/json" "localhost:3000/api/beacons" -d '
{
  "beacon_id": "2",
  "employee_id": "1"
}'
=end