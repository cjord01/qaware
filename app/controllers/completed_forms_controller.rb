class CompletedFormsController < ApplicationController
  def index
    @completed_forms = CompletedForm.all
  end

  def show
    @completed_form = CompletedForm.find(params[:id])
    @questions = @completed_form.questions
    @responses = @completed_form.responses
  end

end
