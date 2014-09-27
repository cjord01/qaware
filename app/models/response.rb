class Response < ActiveRecord::Base
  belongs_to :possible_response
  belongs_to :completed_form
end
