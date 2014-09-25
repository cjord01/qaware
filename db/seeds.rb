# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Form.create(title: "Bathroom", beacon: 1)
Form.create(title: "Kitchen", beacon: 2)
Form.create(title: "Keg", beacon: 3)

Question.create(text: "Name?", form_id: 1)
Question.create(text: "Is it clean?", form_id: 1)
Question.create(text: "Are there papertowels?", form_id: 1)
Question.create(text: "Is there soap?", form_id: 1)

Question.create(text: "Name?", form_id: 2)
Question.create(text: "Is it clean?", form_id: 2)
Question.create(text: "Are there dirty dishes?", form_id: 2)
Question.create(text: "Does the trash need to be dumped?", form_id: 2)

Question.create(text: "Name?", form_id: 3)
Question.create(text: "Is there beer?", form_id: 3)
Question.create(text: "Is the keg functional?", form_id: 3)
Question.create(text: "What kind of beer is it?", form_id: 3)

CompletedForm.create(form_id: 1)
CompletedForm.create(form_id: 2)
CompletedForm.create(form_id: 3)

Responses.create(completed_form_id: 1, question_id: 1, text: "Jim")
Responses.create(completed_form_id: 1, question_id: 2, text: "Yes")
Responses.create(completed_form_id: 1, question_id: 3, text: "Yes")
Responses.create(completed_form_id: 1, question_id: 4, text: "Yes")

Responses.create(completed_form_id: 2, question_id: 5, text: "Jim")
Responses.create(completed_form_id: 2, question_id: 6, text: "Yes")
Responses.create(completed_form_id: 2, question_id: 7, text: "Yes")
Responses.create(completed_form_id: 2, question_id: 8, text: "Yes")

Responses.create(completed_form_id: 3, question_id: 9, text: "Jim")
Responses.create(completed_form_id: 3, question_id: 10, text: "Yes")
Responses.create(completed_form_id: 3, question_id: 11, text: "Yes")
Responses.create(completed_form_id: 3, question_id: 12, text: "Yes")


























