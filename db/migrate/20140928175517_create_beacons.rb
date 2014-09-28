class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.string :location
      t.string :uuid
      t.integer :major
      t.integer :minor
      t.belongs_to :form

      t.timestamps
    end
  end
end
