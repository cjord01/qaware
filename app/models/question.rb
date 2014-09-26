class Question < ActiveRecord::Base
  belongs_to :form
  has_one :response
end
