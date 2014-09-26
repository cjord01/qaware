class Employee < ActiveRecord::Base
  belongs_to :manager
  has_many :completed_forms
end
