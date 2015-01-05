require 'spec_helper'

feature "Deleting Projects" do 
	scenario "Deleting a project" do
		FactoryGirl.create(:project, name: "Fuck You")

		visit '/'
		click_link 'Fuck You'
		click_link 'Delete Project'

		expect(page).to have_content("Project has been destroyed.")

		visit '/'
		expect(page).to have_no_content("Fuck You")

	end
end