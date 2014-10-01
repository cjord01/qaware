require 'rails_helper'

describe 'Employee' do
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

  it 'has a manager' do
    expect(@employee.manager.name).to eq('rick')
  end

  it 'has a name' do
    expect(@employee.name).to eq('brandon')
  end

  it 'has completed_forms' do
    expect(@employee.completed_forms.size).to eq(1)
  end
end
