require 'rails_helper'

describe 'Form' do
  before(:each) do
    @form = Form.create(title: "Bathroom", beacon: 1)
    @question1 = Question.create(text: "Are there papertowels?", form_id: @form.id)
    @question2 = Question.create(text: "Does everyone has shoes on?", form_id: @form.id)
    @completed_form = CompletedForm.create(form_id: @form.id)
    @response1 = Response.create(completed_form_id: @completed_form.id, question_id: @question1.id, text: "Yes")
    @response2 = Response.create(completed_form_id: @completed_form.id, question_id: @question2.id, text: "No")
  end

  it 'has a title' do
    expect(@form.title).to eq('Bathroom')
  end

  it 'shows the correct number of questions' do
    expect(@form.questions.size).to eq(2)
  end

  it 'shows the correct questions' do
    expect(@form.questions.first.text).to eq('Are there papertowels?')
    expect(@form.questions.second.text).to eq('Does everyone has shoes on?')
  end

end

