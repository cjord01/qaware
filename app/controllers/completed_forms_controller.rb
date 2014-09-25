class CompletedFormsController < ApplicationController
  def index
    @completed = CompletedForm.all
  end
end
