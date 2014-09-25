class CompletedForm < ActiveRecord::Base
  belongs_to :form
  has_many :responses
  has_many :questions, through: :responses
end
