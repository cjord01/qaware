class ApiController < ApplicationController

  def hello
    respond_to do |format|
      format.json do
        render :json => {
          :message => "yippy kai ay motherfather!",
          :html => "<b>whatthisbe</b>"
        }.to_json
      end
    end
  end
end
