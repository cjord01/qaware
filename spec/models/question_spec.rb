require 'rails_helper'

describe 'Question' do
  before(:each) do
    @form = Form.create(title: "Bathroom", beacon: 1)
    @question = Question.create(text: "Are there papertowels?", form_id: @form.id)
    @completed_form1 = CompletedForm.create(form_id: @form.id)
    @completed_form2 = CompletedForm.create(form_id: @form.id)
    @completed_form3 = CompletedForm.create(form_id: @form.id)
    @response1 = Response.create(completed_form_id: @completed_form1.id, question_id: @question.id, text: "Yes")
    @response2 = Response.create(completed_form_id: @completed_form2.id, question_id: @question.id, text: "No")
    @response3 = Response.create(completed_form_id: @completed_form3.id, question_id: @question.id, text: "Other")
  end

  it 'knows what form it came from' do
    expect(@question.form.title).to eq('Bathroom')
  end

  it "can access all of it's responses" do
    expect(@question.responses.size).to eq(3)
  end

  it 'can access a specific response' do
    expect(@question.responses.first.text).to eq('Yes')
  end

end
