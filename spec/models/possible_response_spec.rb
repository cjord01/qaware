require 'rails_helper'

describe 'PossibleResponse' do
  before(:each) do
    @manager = Manager.create(name: 'rick', email: 'manager@test.com', password_digest: 'password')
    @employee = Employee.create(name: 'brandon', manager_id: @manager.id, email: 'me@test.com')
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

  it 'knows what question it came from' do
    expect(@possible_response1.question.text).to eq("Are there papertowels?")
  end

  it 'knows what form it came from' do
    expect(@possible_response1.question.form.title).to eq("Bathroom")
  end

  it 'has a string response' do
    expect(@possible_response1.text).to be_a(String)
  end

  it 'has a number value' do
    expect(@possible_response1.number_value).to be_an(Integer)
  end
end
