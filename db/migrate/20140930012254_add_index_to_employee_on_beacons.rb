class AddIndexToEmployeeOnBeacons < ActiveRecord::Migration
  def change
  	add_index :beacons, :employee_id
  end
end
