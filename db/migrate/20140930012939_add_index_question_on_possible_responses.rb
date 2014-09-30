class AddIndexQuestionOnPossibleResponses < ActiveRecord::Migration
  def change
  	add_index :possible_responses, :question_id
  end
end
