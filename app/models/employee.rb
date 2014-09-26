class Employee < ActiveRecord::Base
  belongs_to :manager
  has_many :completed_forms

  validates :name, presence: :true
  validates :email, presence: :true
end
