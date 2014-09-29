class Api::BeaconsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def update
    beacon = Beacon.find(params[:beacon_id])
    beacon.update!(employee_id: params[:employee_id])
    head :updated
  end

  def destroy
    beacon = Beacon.find(params[:beacon_id])
    beacon.update!(employee_id: nil)
    head :deleted
  end
end

# TEST ENTER REGION
=begin
curl -XPUT -H "Content-Type: application/json" "localhost:3000/api/beacons" -d '
{
  "beacon_id": "1",
  "employee_id": "1"
}'
=end

# TEST EXIT REGION
=begin
curl -XDELETE -H "Content-Type: application/json" "localhost:3000/api/beacons" -d '
{
  "beacon_id": "1",
  "employee_id": "1"
}'
=end