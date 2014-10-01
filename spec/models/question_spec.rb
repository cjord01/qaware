require 'rails_helper'

describe 'Question' do
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

  it 'knows what form it came from' do
    expect(@question1.form.title).to eq('Bathroom')
  end

  it "can access all of it's possible_responses" do
    expect(@question1.possible_responses.size).to eq(2)
  end

  it 'can access a specific response' do
    expect(@question1.possible_responses.first.text).to eq('Yes')
  end

end
