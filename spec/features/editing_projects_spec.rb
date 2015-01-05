require 'spec_helper'

feature "Editing Projects" do 
	before do 
		FactoryGirl.create(:project, name: "Fuck You")

		visit '/'
		click_link "Fuck You"
		click_link "Edit Project"
	end

	scenario "Updating a project" do 
		
		fill_in "Name", with: "Fuck you all"
		click_button "Update Project"

		expect(page).to have_content("Project has been updated.")
	end

	scenario "Updating a project with invalid attributed is bad" do
		fill_in "Name", with: ""
		click_button "Update Project"
		expect(page).to have_content("Project has not been updated")
	end
end