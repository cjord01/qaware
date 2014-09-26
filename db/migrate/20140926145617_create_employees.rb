class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.belongs_to :manager

      t.timestamps
    end
  end
end
