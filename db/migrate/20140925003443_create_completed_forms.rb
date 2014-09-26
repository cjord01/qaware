class CreateCompletedForms < ActiveRecord::Migration
  def change
    create_table :completed_forms do |t|
      t.belongs_to :form
      t.belongs_to :employee

      t.timestamps
    end
  end
end
