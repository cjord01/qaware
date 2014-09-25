class CompletedFormsController < ApplicationController
  def index
    @completed = CompletedForm.all
  end

  def create
  	@completed = CompletedForm.create!(form_id: params[:responses][:form_id])
  	params[:responses].each do |question_id, response|
  		Response.create!(text: response, question_id: question_id, completed_form_id: @completed.id)
  	end
  	redirect_to forms_path
  end
end
