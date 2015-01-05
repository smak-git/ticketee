require 'spec_helper'

feature "Editing tickets" do 
	let!(:project) {FactoryGirl.create(:project)}
	let!(:ticket) {FactoryGirl.create(:ticket, project: project)}

	before do 
		visit '/'
		click_link project.name
		click_link ticket.title
		click_link "Edit Ticket"
	end

	scenario "Updating ticket" do 
		fill_in "Title", with: "Fuck yeah dickhead"
		click_button "Update Ticket"

		expect(page).to have_content("Ticket has been updated")

		within("#ticket h2") do
			expect(page).to have_content("Fuck yeah dickhead")
		end

		expect(page).to_not have_content ticket.title
	end

	scenario "Updating ticket with invalid information" do
		fill_in "Title", with: ""
		click_button "Update Ticket"

		expect(page).to have_content("Ticket has not been updated")
	end
end