class FormsController < ApplicationController

  def index
    @forms = Form.all

  end

  def show
    @form = Form.find(params[:id])
  end
end
