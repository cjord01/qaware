class Form < ActiveRecord::Base
  belongs_to :manager
  has_many :questions
  has_many :completed_forms
  has_one :beacon
end
