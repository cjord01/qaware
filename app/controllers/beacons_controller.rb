class BeaconsController < ApplicationController
  def index
    @beacons = Beacon.all
    @completed_forms = CompletedForm.all
    @forms = Form.all
  end
end
