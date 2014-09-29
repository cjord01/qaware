class Beacon < ActiveRecord::Base
  has_many :forms
  belongs_to :employee
end
