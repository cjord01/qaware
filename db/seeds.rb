Form.delete_all
Question.delete_all
CompletedForm.delete_all
Response.delete_all
Manager.delete_all
Employee.delete_all

manager = Manager.create(name: "rick", email: "rick@gmail.com", password: "password", password_confirmation: "password")

# mike = Employee.create(name: "Mike Baker", email: Faker::Internet.email, manager_id: manager.id)
# matt = Employee.create(name: "Matt Busch", email: Faker::Internet.email, manager_id: manager.id)

employees = []

5.times do
  employees << Employee.create(name: Faker::Name.name, email:Faker::Internet.email, manager_id: manager.id)
end

form1 = Form.create(title: "Restroom", beacon: 1, manager_id: manager.id)
form2 = Form.create(title: "Kitchen", beacon: 2, manager_id: manager.id)
form3 = Form.create(title: "Keg", beacon: 3, manager_id: manager.id)


# Questions for restroom
question2 = Question.create(text: "How many bottles of hand soap were used today?", form_id: form1.id)
question4 = Question.create(text: "How many packages of papertowels were used today?", form_id: form1.id)
question3 = Question.create(text: "Were there papertowels used on the floor?", form_id: form1.id)
question4 = Question.create(text: "Was there urine around the urinals?", form_id: form1.id)
question5 = Question.create(text: "Does the restroom smell bad?", form_id: form1.id)
question6 = Question.create(text: "Is everyone wearing shoes?", form_id: form1.id)
question7 = Question.create(text: "Were any toilets clogged?", form_id: form1.id)
question8 = Question.create(text: "Is there gum on the urinal traps?", form_id: form1.id)

# Questions for Kitchen
question9 = Question.create(text: "Is the trash can full?", form_id: form2.id)
question10 = Question.create(text: "Are there dirty dishes in the sink?", form_id: form2.id)
question11 = Question.create(text: "Is the microwave a mess?", form_id: form2.id)
question12 = Question.create(text: "How many bottles of dishsoap was used?", form_id: form2.id)
question13 = Question.create(text: "Do the fridges have ancient food?", form_id: form2.id)
question14 = Question.create(text: "How many powerball tabs were used?", form_id: form2.id)
question15 = Question.create(text: "How many dry food bins are being used?", form_id: form2.id)


# Questions for Keg
question16 = Question.create(text: "Is there beer?", form_id: form3.id)
question11 = Question.create(text: "Is the keg functional?", form_id: form3.id)
question12 = Question.create(text: "Is the drip pan clean?", form_id: form3.id)
question12 = Question.create(text: "What is the CO2 pressure reading?", form_id: form3.id)
question12 = Question.create(text: "What kind of beer is it?", form_id: form3.id)
question12 = Question.create(text: "Are the hoses in good working order?", form_id: form3.id)
question12 = Question.create(text: "Are the seals still working properly?", form_id: form3.id)
question12 = Question.create(text: "How many packages of cups were used?", form_id: form3.id)

# Completed forms for restroom
15.times do 
	CompletedForm.create(form_id: form1.id, employee_id: employees.sample.id)
end


# Completed forms for Kitchen
15.times do 
	CompletedForm.create(form_id: form2.id, employee_id: employees.sample.id)
end

# Completed forms for Keg
15.times do 
	CompletedForm.create(form_id: form3.id, employee_id: employees.sample.id)
end


Response.create(completed_form_id: completed1.id, question_id: question2.id, text: "Yes")
Response.create(completed_form_id: completed1.id, question_id: question3.id, text: "Yes")
Response.create(completed_form_id: completed1.id, question_id: question4.id, text: "Yes")

Response.create(completed_form_id: completed2.id, question_id: question6.id, text: "Yes")
Response.create(completed_form_id: completed2.id, question_id: question7.id, text: "Yes")
Response.create(completed_form_id: completed2.id, question_id: question8.id, text: "Yes")

Response.create(completed_form_id: completed3.id, question_id: question10.id, text: "Yes")
Response.create(completed_form_id: completed3.id, question_id: question11.id, text: "Yes")
Response.create(completed_form_id: completed3.id, question_id: question12.id, text: "Yes")


























