class CompletedFormsController < ApplicationController

  def index
    @completed_forms = CompletedForm.all
  end

  def create
    # raise params.inspect
  	@completed = CompletedForm.create!(form_id: params[:response][:form_id], employee_id: params[:response][:employee_id])
  	params[:responses].each do |question_id, response|
  		Response.create!(text: response, question_id: question_id, completed_form_id: @completed.id)
  	end
  	redirect_to forms_path
  end

  def show
    @completed_form = CompletedForm.find(params[:id])
    @questions = @completed_form.questions
    @responses = @completed_form.responses
  end

end
