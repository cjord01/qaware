class PossibleResponse < ActiveRecord::Base
  has_one :response
  belongs_to :question
end
