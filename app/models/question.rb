class Question < ActiveRecord::Base
  belongs_to :form
  has_many :possible_responses
  has_one :response, through: :possible_responses
end
