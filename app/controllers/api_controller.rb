class ApiController < ApplicationController

  def hello
    # respond_to do |format|
    #   format.json do
    #     render :json => {
    #       :message => "yippy kai ay motherfather!",
    #       :html => "<b>whatthisbe</b>"
    #     }.to_json
    #   end
    # end
    @forms = {
      form1: "this is form 1",
      form2: "this is form 2",
      form3: "this is form 3"
    }
    @string = "yippy kai yay motherfather"
    render :json => @forms.to_json   
 # respond_to do |format|
    #   format.html 
    #   format.json { render @string  }
    #   format.json 
    # end
  end
end
