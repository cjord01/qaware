class Manager < ActiveRecord::Base
  has_many :employees
  has_many :completed_forms
  has_many :forms
  has_secure_password
end
