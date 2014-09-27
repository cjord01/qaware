class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :possible_response
      t.belongs_to :completed_form

      t.timestamps
    end
  end
end
