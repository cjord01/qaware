class GraphsController < ApplicationController

	def index
		@restroom_form = Form.where(title: "Restroom")
    	@kitchen_form = Form.where(title: "Kitchen")
    	@keg_form = Form.where(title: "Keg")
	end

end