class AddIndexToEmployeeOnCompletedForms < ActiveRecord::Migration
  def change
  	add_index :completed_forms, :employee_id
  end
end
