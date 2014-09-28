class Form < ActiveRecord::Base
  belongs_to :manager
  has_many :questions
  has_many :completed_forms

	def first_values
		self.questions.first.responses.map(&:possible_response).map(&:number_value)
	end

	def second_values
		self.questions.second.responses.map(&:possible_response).map(&:number_value)
	end 

	def third_values
		self.questions.third.responses.map(&:possible_response).map(&:number_value)
	end

	def first_get_possible
		self.questions.first.possible_responses.map(&:text)
	end 

	def get_complete_dates
		self.completed_forms.map(&:date)
	end

end
