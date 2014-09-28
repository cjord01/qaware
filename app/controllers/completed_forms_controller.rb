class CompletedFormsController < ApplicationController

  def index

    @completed_forms = CompletedForm.all
    @forms = Form.all

    if session[:manager_id]
      @completed_forms = CompletedForm.all
    else
      redirect_to root_path
    end

  end

  def create
    # raise params.inspect
  	@completed = CompletedForm.create!(form_id: params[:response][:form_id], employee_id: params[:response][:employee_id])
  	params[:responses].each do |question_id, response|
  		Response.create!( possible_response_id: response, completed_form_id: @completed.id)
  	end
  	redirect_to forms_path
  end

  def show
    if session[:manager_id]
      @completed_form = CompletedForm.find(params[:id])
      @questions = @completed_form.questions
      @responses = @completed_form.responses
    else
      redirect_to root_path
    end
  end

end
