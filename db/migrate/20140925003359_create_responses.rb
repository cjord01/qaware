class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :text
      t.belongs_to :question
      t.belongs_to :completed_form

      t.timestamps
    end
  end
end
