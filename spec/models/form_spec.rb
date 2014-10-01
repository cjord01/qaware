require 'rails_helper'

describe 'Form' do
  before(:each) do
    @manager = Manager.create(name: 'rick')
    @employee = Employee.create(name: 'brandon', manager: @manager_id)
    @form = Form.create(title: "Bathroom", manager_id: @manager.id)
    @question1 = Question.create(text: "Are there papertowels?", form_id: @form.id)
    @question2 = Question.create(text: "Does everyone has shoes on?", form_id: @form.id)
    @possible_response1 = PossibleResponse.create(question_id: @question1.id, text: 'Yes', number_value: 0)
    @possible_response2 = PossibleResponse.create(question_id: @question1.id, text: 'No', number_value: 1)
    @possible_response3 = PossibleResponse.create(question_id: @question2.id, text: 'Yes', number_value: 0)
    @possible_response4 = PossibleResponse.create(question_id: @question2.id, text: 'No', number_value: 1)
    @completed_form = CompletedForm.create(form_id: @form.id, employee_id: @employee.id)
    @response1 = Response.create(completed_form_id: @completed_form.id, possible_response_id: @possible_response1.id)
    @response2 = Response.create(completed_form_id: @completed_form.id, possible_response_id: @possible_response4.id)
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

