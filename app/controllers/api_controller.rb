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
    data = {
      uuid: "FFC26D16-3710-4922-80CB-7E53E92443E4",
      major: 1,
      locations: [
        { name: "Kegerator", minor: 2, url: "forms/1" },
        { name: "Kitchen", minor: 3, url: "forms/2" },
        { name: "Bathroom", minor: 4, url: "forms/3" }
      ]
    }
    render :json => data.to_json
  end
end
