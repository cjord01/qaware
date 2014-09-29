class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :location
      t.string :uuid
      t.integer :major
      t.integer :minor
      t.integer :employee_id

      t.timestamps
    end
  end
end
