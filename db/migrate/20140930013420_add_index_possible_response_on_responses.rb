class AddIndexPossibleResponseOnResponses < ActiveRecord::Migration
  def change
  	add_index :responses, :possible_response_id
  end
end
