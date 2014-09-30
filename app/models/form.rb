class Form < ActiveRecord::Base
  belongs_to :manager
  belongs_to :beacon
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

	def second_get_possible
		self.questions.second.possible_responses.map(&:text)
	end 

	def third_get_possible
		self.questions.third.possible_responses.map(&:text)
	end 

	def get_complete_dates
		self.completed_forms.map(&:date)
	end

end
