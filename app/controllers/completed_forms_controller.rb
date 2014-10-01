class CompletedFormsController < ApplicationController

  def index


    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').all
      @last_id = CompletedForm.last.id
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

  def keg
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').where(form_id: 1)
    else
      redirect_to root_path
    end
  end

  def kitchen
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').where(form_id: 2)
    else
      redirect_to root_path
    end
  end

  def restroom
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').where(form_id: 3)
    else
      redirect_to root_path
    end
  end

  def today
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').total_today
    else
      redirect_to root_path
    end
  end

  def week
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').total_this_week
    else
      redirect_to root_path
    end
  end

  def month
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').total_this_month
    else
      redirect_to root_path
    end
  end

  def keg_today
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').today(1)
    else
      redirect_to root_path
    end
  end

  def keg_week
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').this_week(1)
    else
      redirect_to root_path
    end
  end

  def keg_month
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').this_month(1)
    else
      redirect_to root_path
    end
  end

  def kitchen_today
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').today(2)
    else
      redirect_to root_path
    end
  end

  def kitchen_week
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').this_week(2)
    else
      redirect_to root_path
    end
  end

  def kitchen_month
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').this_month(2)
    else
      redirect_to root_path
    end
  end

  def restroom_today
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').today(3)
    else
      redirect_to root_path
    end
  end

  def restroom_week
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').this_week(3)
    else
      redirect_to root_path
    end
  end

  def restroom_month
    if session[:manager_id]
      @completed_forms = CompletedForm.order('created_at DESC').this_month(3)
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
