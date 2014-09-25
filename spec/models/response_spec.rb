require 'rails_helper'

describe 'Question' do
  before(:each) do
    @form = Form.create(title: "Bathroom", beacon: 1)
    @question = Question.create(text: "Are there papertowels?", form_id: @form.id)
    @completed_form = CompletedForm.create(form_id: @form.id)
    @response = Response.create(completed_form_id: @completed_form.id, question_id: @question.id, text: "Yes")
  end

  it 'knows what question it came from' do
    expect(@response.question.text).to eq('Are there papertowels?')
  end

  it "knows what form it came from" do
    expect(@response.completed_form.title).to eq('Bathroom')
  end

  # it 'can access a specific response' do
  #   expect(@question.responses.first.text).to eq('Yes')
  # end

end
