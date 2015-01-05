require 'spec_helper'

feature "Viewing projects" do 
	scenario "Listing all projects" do 
		project = FactoryGirl.create(:project, name: "Fuck You")
		visit '/'
		click_link 'Fuck You'
		expect(page.current_url).to eql(project_url(project))
	end
end