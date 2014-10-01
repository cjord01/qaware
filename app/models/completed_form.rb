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
    self.created_at.strftime('%l:%M%P')
  end

  def title
    self.form.title
  end

  def name
    self.employee.name
  end

  def zip_it
    questions = self.questions.map { |q| "QUESTION: #{q.text}"}
    responses = self.responses.map { |a| "RESPONSE: #{a.possible_response.text}"}
    questions.zip(responses)
  end

  def self.today(form)
    forms = self.where(form_id: form)
    forms.where(created_at: (Date.today)..(Date.today + 1))
  end

  def self.this_week(form)
    forms = self.where(form_id: form)
    forms.where(created_at: (Date.today - 7)..(Date.today + 1))
  end

  def self.this_month(form)
    forms = self.where(form_id: form)
    forms.where(created_at: (Date.today - 30)..(Date.today + 1))
  end

  def self.total_today
    self.where(created_at: (Date.today)..(Date.today + 1))
  end

  def self.total_this_week
    self.where(created_at: (Date.today - 7)..(Date.today + 1))
  end

  def self.total_this_month
    self.where(created_at: (Date.today - 30)..(Date.today + 1))
  end



end
