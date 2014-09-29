# CLEAR ALL DATA
	Form.delete_all
	Question.delete_all
	CompletedForm.delete_all
	Response.delete_all
	Manager.delete_all
	Employee.delete_all
	PossibleResponse.delete_all


# CREATE MANAGER
	manager = Manager.create(name: "rick", email: "rick@gmail.com", password: "password", password_confirmation: "password")


# CREATE EMPLOYEES
	employees = []
	employees << Employee.create(name: "Brandon Manson", email: "mansonbrandon@gmail.com", manager_id: manager.id)
	employees << Employee.create(name: "Zach Taylor", email: "taylorzr@gmail.com", manager_id: manager.id)
	employees << Employee.create(name: "Clayton Jordan", email: "clayjchicago@gmail.com", manager_id: manager.id)
	employees << Employee.create(name: "Mike Baker", email: "mikebaker@devbootcamp.com", manager_id: manager.id)
	employees << Employee.create(name: "Matt Busch", email: "mattbusch@devbootcamp.com", manager_id: manager.id)


# CREATE BEACONS
	keg_beacon = Beacon.create(location: "Keg", uuid: "FFC26D16-3710-4922-80CB-7E53E92443E4", major: 1, minor: 2)
	kitchen_beacon = Beacon.create(location: "Kitchen", uuid: "FFC26D16-3710-4922-80CB-7E53E92443E4", major: 1, minor: 3)
	restroom_beacon = Beacon.create(location: "Restroom", uuid: "FFC26D16-3710-4922-80CB-7E53E92443E4", major: 1, minor: 4)


# CREATE FORMS
	form1 = Form.create(title: "Keg", manager_id: manager.id, beacon: keg_beacon)
	form2 = Form.create(title: "Kitchen", manager_id: manager.id, beacon: kitchen_beacon)
	form3 = Form.create(title: "Restroom", manager_id: manager.id, beacon: restroom_beacon)


# Questions for restroom
	question1 = Question.create(text: "How full is the soap dispenser?", form_id: form1.id)
		possible_response1 = PossibleResponse.create(question_id: question1.id, text: "Empty", number_value: 0)
		possible_response2 = PossibleResponse.create(question_id: question1.id, text: "Running Low", number_value: 1)
		possible_response3 = PossibleResponse.create(question_id: question1.id, text: "Partially Full", number_value: 2)
		possible_response4 = PossibleResponse.create(question_id: question1.id, text: "Completely Full", number_value: 3)

	question2 = Question.create(text: "How many rolls of toilet paper are there?", form_id: form1.id)
		possible_response5 = PossibleResponse.create(question_id: question2.id, text: "0 Rolls", number_value: 0)
		possible_response6 = PossibleResponse.create(question_id: question2.id, text: "1-2 Rolls", number_value: 1)
		possible_response7 = PossibleResponse.create(question_id: question2.id, text: "3-5 Rolls", number_value: 2)
		possible_response8 = PossibleResponse.create(question_id: question2.id, text: "Rick Rolls", number_value: 3)

	question3 = Question.create(text: "How many used papertowels are on the floor?", form_id: form1.id)
		possible_response9 = PossibleResponse.create(question_id: question3.id, text: "None", number_value: 0)
		possible_response10 = PossibleResponse.create(question_id: question3.id, text: "A few", number_value: 1)
		possible_response11 = PossibleResponse.create(question_id: question3.id, text: "A bunch", number_value: 2)
		possible_response12 = PossibleResponse.create(question_id: question3.id, text: "Let's just stick to hand dryers", number_value: 3)

# Questions for Kitchen
	question4 = Question.create(text: "How full is the trash can?", form_id: form2.id)
		possible_response13 = PossibleResponse.create(question_id: question4.id, text: "Empty", number_value: 0)
		possible_response14 = PossibleResponse.create(question_id: question4.id, text: "Some garbage", number_value: 1)
		possible_response15 = PossibleResponse.create(question_id: question4.id, text: "Partially full", number_value: 2)
		possible_response16 = PossibleResponse.create(question_id: question4.id, text: "It must be a national holiday", number_value: 3)

	question5 = Question.create(text: "How many dirty dishes are there in the sink?", form_id: form2.id)
		possible_response17 = PossibleResponse.create(question_id: question5.id, text: "None", number_value: 0)
		possible_response18 = PossibleResponse.create(question_id: question5.id, text: "A few", number_value: 1)
		possible_response19 = PossibleResponse.create(question_id: question5.id, text: "A bunch", number_value: 2)
		possible_response20 = PossibleResponse.create(question_id: question5.id, text: "Is the dish washer broken?", number_value: 3)

	question6 = Question.create(text: "How messy is the microwave?", form_id: form2.id)
		possible_response21 = PossibleResponse.create(question_id: question6.id, text: "Super clean", number_value: 0)
		possible_response22 = PossibleResponse.create(question_id: question6.id, text: "Kind of messy", number_value: 1)
		possible_response23 = PossibleResponse.create(question_id: question6.id, text: "Some food splatters", number_value: 2)
		possible_response24 = PossibleResponse.create(question_id: question6.id, text: "I must be looking in the garbage can", number_value: 3)

# Questions for Keg
	question7 = Question.create(text: "How much beer is there?", form_id: form3.id)
		possible_response25 = PossibleResponse.create(question_id: question7.id, text: "None at all", number_value: 0)
		possible_response26 = PossibleResponse.create(question_id: question7.id, text: "Half a keg", number_value: 1)
		possible_response27 = PossibleResponse.create(question_id: question7.id, text: "A party's worth", number_value: 2)
		possible_response28 = PossibleResponse.create(question_id: question7.id, text: "Full, but don't let Brandon anywhere near it", number_value: 3)

	question8 = Question.create(text: "How cold is the beer?", form_id: form3.id)
		possible_response29 = PossibleResponse.create(question_id: question8.id, text: "Ice cold", number_value: 0)
		possible_response30 = PossibleResponse.create(question_id: question8.id, text: "Cold", number_value: 1)
		possible_response31 = PossibleResponse.create(question_id: question8.id, text: "Room Temp", number_value: 2)
		possible_response32 = PossibleResponse.create(question_id: question8.id, text: "Is this thing filled with coffee?", number_value: 3)

	question9 = Question.create(text: "What is the level of CO2 pressure?", form_id: form3.id)
		possible_response33 = PossibleResponse.create(question_id: question9.id, text: "Low Pressure", number_value: 0)
		possible_response34 = PossibleResponse.create(question_id: question9.id, text: "Medium Pressure", number_value: 1)
		possible_response35 = PossibleResponse.create(question_id: question9.id, text: "Under Pressure", number_value: 2)
		possible_response36 = PossibleResponse.create(question_id: question9.id, text: "Queen feat. David Bowie", number_value: 3)

# Completed forms for restroom
	day1 = 0
	10.times do
		day1 += 1
		completed = CompletedForm.create(form_id: form1.id, employee_id: employees.sample.id, created_at: Date.today - day1)
		Response.create(completed_form_id: completed.id, possible_response_id: [1,2,3,4].sample)
		Response.create(completed_form_id: completed.id, possible_response_id: [5,6,7,8].sample)
		Response.create(completed_form_id: completed.id, possible_response_id: [9,10,11,12].sample)
	end


# Completed forms for Kitchen
	day2 = 0
	10.times do
		day2 += 1
		completed = CompletedForm.create(form_id: form2.id, employee_id: employees.sample.id, created_at: Date.today - day2)
	 	Response.create(completed_form_id: completed.id, possible_response_id: [13,14,15,16].sample)
		Response.create(completed_form_id: completed.id, possible_response_id: [17,18,19,20].sample)
		Response.create(completed_form_id: completed.id, possible_response_id: [21,22,23,24].sample)
	end

# Completed forms for Keg
	day3 = 0
	10.times do
			day3 += 1
		completed = CompletedForm.create(form_id: form3.id, employee_id: employees.sample.id, created_at: Date.today - day3)
		Response.create(completed_form_id: completed.id, possible_response_id: [25,26,27,28].sample)
		Response.create(completed_form_id: completed.id, possible_response_id: [29,30,31,32].sample)
		Response.create(completed_form_id: completed.id, possible_response_id: [33,34,35,36].sample)
	end




















