class AddIndexManagerOnEmployees < ActiveRecord::Migration
  def change
  	add_index :employees, :manager_id
  end
end
