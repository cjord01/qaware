require 'rails_helper'
require 'date'
require 'time'

describe 'CompletedForm' do
  before(:each) do
    @form = Form.create(title: "Bathroom", beacon: 1)
    @question1 = Question.create(text: "Are there papertowels?", form_id: @form.id)
    @question2 = Question.create(text: "Does everyone has shoes on?", form_id: @form.id)
    @completed_form = CompletedForm.create(form_id: @form.id)
    @response1 = Response.create(completed_form_id: @completed_form.id, question_id: @question1.id, text: "Yes")
    @response2 = Response.create(completed_form_id: @completed_form.id, question_id: @question2.id, text: "No")
  end

  it 'has a title' do
    expect(@completed_form.title).to eq('Bathroom')
  end

  it 'shows the correct number of questions' do
    expect(@completed_form.questions.size).to eq(2)
  end

  it 'shows the correct questions' do
    expect(@completed_form.questions.first.text).to eq('Are there papertowels?')
    expect(@completed_form.questions.second.text).to eq('Does everyone has shoes on?')
  end

  it 'shows the correct number of responses' do
    expect(@completed_form.responses.size).to eq(2)
  end

  it 'shows the correct response' do
    expect(@completed_form.responses.first.text).to eq('Yes')
    expect(@completed_form.responses.second.text).to eq('No')
  end

  it 'has a correctly formated date' do
    expect(@completed_form.date).to eq(@completed_form.created_at.strftime('%m/%e/%y'))
  end

  it 'has a correctly formated time' do
    expect(@completed_form.time).to eq(@completed_form.created_at.strftime('%k:%M%P'))
  end

  # pending 'shows the correct employee' do

  # end
end
