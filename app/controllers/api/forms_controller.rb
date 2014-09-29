class Api::FormsController < ApplicationController
  def index
    forms = Form.all
    render json: forms.to_json(include: :beacon)
  end
end
