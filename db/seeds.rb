# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Form.delete_all
Question.delete_all
CompletedForm.delete_all
Response.delete_all

form1 = Form.create(title: "Bathroom", beacon: 1)
form2 = Form.create(title: "Kitchen", beacon: 2)
form3 = Form.create(title: "Keg", beacon: 3)

question2 = Question.create(text: "Are there papertowels?", form_id: form1.id)
question3 = Question.create(text: "Is there soap?", form_id: form1.id)
question4 = Question.create(text: "Is everyone wearing shoes?", form_id: form1.id)

question6 = Question.create(text: "Is it clean?", form_id: form2.id)
question7 = Question.create(text: "Are there dirty dishes?", form_id: form2.id)
question8 = Question.create(text: "Does the trash need to be dumped?", form_id: form2.id)

question10 = Question.create(text: "Is there beer?", form_id: form3.id)
question11 = Question.create(text: "Is the keg functional?", form_id: form3.id)
question12 = Question.create(text: "What kind of beer is it?", form_id: form3.id)

completed1 = CompletedForm.create(form_id: form1.id)
completed2 = CompletedForm.create(form_id: form2.id)
completed3 = CompletedForm.create(form_id: form3.id)

Response.create(completed_form_id: completed1.id, question_id: question2.id, text: "Yes")
Response.create(completed_form_id: completed1.id, question_id: question3.id, text: "Yes")
Response.create(completed_form_id: completed1.id, question_id: question4.id, text: "Yes")

Response.create(completed_form_id: completed2.id, question_id: question6.id, text: "Yes")
Response.create(completed_form_id: completed2.id, question_id: question7.id, text: "Yes")
Response.create(completed_form_id: completed2.id, question_id: question8.id, text: "Yes")

Response.create(completed_form_id: completed3.id, question_id: question10.id, text: "Yes")
Response.create(completed_form_id: completed3.id, question_id: question11.id, text: "Yes")
Response.create(completed_form_id: completed3.id, question_id: question12.id, text: "Yes")


























