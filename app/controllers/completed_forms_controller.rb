class CompletedFormsController < ApplicationController

  def index
    @completed_forms = CompletedForm.all
    @restroom_form = Form.where(title: "Restroom")
    @kitchen_form = Form.where(title: "Kitchen")
    @keg_form = Form.where(title: "Keg")
    @last_id = CompletedForm.last.id
    @forms = Form.all

    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').all
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
    redirect_to forms_confirmation_path
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

  def refresh
    last_id = params[:id]
    @completed_forms = CompletedForm.where("id > ?", last_id)

    render :json => @completed_forms.to_json(:include => {:employee => {:only => :name},
                                                         :form => { :only => :title }})
  end

end
