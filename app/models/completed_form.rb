class CompletedForm < ActiveRecord::Base
  belongs_to :form
  belongs_to :manager
  belongs_to :employee
  has_many :responses
  has_many :questions, through: :responses

  def date
    self.created_at.strftime('%m/%e/%y')
  end

  def time
    self.created_at.strftime('%k:%M%P')
  end

  def title
    self.form.title
  end

end
