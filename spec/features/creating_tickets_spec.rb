require 'spec_helper'

feature "Creating Tickets" do 
	before do 
		FactoryGirl.create(:project, name: "Fuck you")

		visit '/'
		click_link "Fuck you"
		click_link "New Ticket"
	end

	scenario "Creating a Ticket" do 
		fill_in "Title", with: "Fuck you ticket"
		fill_in "Description", with: "Hahahahaha"
		click_button "Create Ticket"

		expect(page).to have_content("Ticket created successfully.")
	end

	scenario "Creating a ticket without valid attributes fails" do
		click_button "Create Ticket"

		expect(page).to have_content("Ticket has not been created.")
		expect(page).to have_content("Title can't be blank")
		expect(page).to have_content("Description can't be blank")
	end

	scenario "Description of ticket to be greater than 10 characters" do
		fill_in "Title", with: "Fuck the ticket"
		fill_in "Description", with: "hahaha"
		click_button "Create Ticket"

		expect(page).to have_content("Ticket has not been created.")
		expect(page).to have_content("Description is too short")
	end
end