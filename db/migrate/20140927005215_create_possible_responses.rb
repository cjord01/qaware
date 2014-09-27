class CreatePossibleResponses < ActiveRecord::Migration
  def change
    create_table :possible_responses do |t|
      t.string :text
      t.integer :number_value
      t.belongs_to :question

      t.timestamps
    end
  end
end
