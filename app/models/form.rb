class Form < ActiveRecord::Base
  belongs_to :manager
  has_many :questions
  has_many :completed_forms

  # get responses for one question
 #  def get_responses
 #  	self.questions.map(&:responses)
 #  end

 #  def get_possible_responses
 #  	get_responses.map(&:possible_response)
 #  end

	# def get_values
	# 	get_possible_responses.map(&:number_value)
	# end
	def get_values
		self.questions.map {|question| question.responses.map { |response| response.possible_response}.map { |choice| choice.number_value }}
	end
end
