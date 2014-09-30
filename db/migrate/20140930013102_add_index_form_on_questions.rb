class AddIndexFormOnQuestions < ActiveRecord::Migration
  def change
  	add_index :questions, :form_id
  end
end
