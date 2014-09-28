class CompletedForm < ActiveRecord::Base
  belongs_to :form
  has_one :manager, through: :employees
  belongs_to :employee
  has_many :responses
  has_many :possible_responses, through: :responses
  has_many :questions, through: :possible_responses

  def date
    self.created_at.strftime('%m/%e/%y')
  end

  def time
    self.created_at.strftime('%k:%M%P')
  end

  def title
    self.form.title
  end

  def zip_it
    questions = self.questions.map { |q| "QUESTION: #{q.text}"}
    responses = self.responses.map { |a| "RESPONSE: #{a.possible_response.text}"}
    questions.zip(responses)
  end

end
