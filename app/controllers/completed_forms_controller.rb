class CompletedFormsController < ApplicationController

  def index
    @completed_forms = CompletedForm.all
    @restroom_form = Form.where(title: "Restroom")
    @kitchen_form = Form.where(title: "Kitchen")
    @keg_form = Form.where(title: "Keg")
    @last_id = CompletedForm.last.id

    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').all
    else
      redirect_to root_path
    end
  end

  def create
    # Variables in case saving the form fails
    @empty_form = Form.find(params[:response][:form_id])
    @employees = Employee.all

    # Roll this back if any of the responses fail saving
    @completed = CompletedForm.create!(form_id: params[:response][:form_id], employee_id: params[:response][:employee_id])
    if not params[:responses] or params[:responses].count != @empty_form.questions.count
      puts "First place"
      render "forms/show", status: 422
    else
      params[:responses].each do |question_id, response|
        response = Response.new( possible_response_id: response, completed_form_id: @completed.id)
        if not response.save
          puts "Second place"
          render "forms/show", status: 422
        end
      end
      redirect_to forms_confirmation_path
    end
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
