class Form < ActiveRecord::Base
  has_many :questions
  has_many :responses, through: :questions
  has_many :completed_forms
end
