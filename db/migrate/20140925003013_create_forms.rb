class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :title
      t.belongs_to :manager
      t.belongs_to :beacon

      t.timestamps
    end
  end
end
