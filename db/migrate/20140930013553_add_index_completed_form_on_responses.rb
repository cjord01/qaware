class AddIndexCompletedFormOnResponses < ActiveRecord::Migration
  def change
  	add_index :responses, :completed_form_id
  end
end
