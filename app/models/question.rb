class Question < ActiveRecord::Base
  belongs_to :form
  has_many :possible_responses
  has_many :responses, through: :possible_responses
end
