class FormsController < ApplicationController

  def index
    @forms = Form.all
  end

  def show
    @empty_form = Form.find(params[:id])
  end
end
