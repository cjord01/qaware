class ApiController < ApplicationController

  def hello

 
    @forms = {
      form1: "this is form 1",
      form2: "this is form 2",
      form3: "this is form 3"
    }

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
