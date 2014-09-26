class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :title
      t.text :beacon
      t.belongs_to :manager

      t.timestamps
    end
  end
end
