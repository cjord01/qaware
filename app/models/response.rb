class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :completed_form
end
