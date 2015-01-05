require 'spec_helper'

feature "Viewing tickets" do 
	before do
		text = FactoryGirl.create(:project, name: "Fuck you")

		FactoryGirl.create(:ticket, project: text, title: "Yo biaches", description: "get the fuck out")

		text2 = FactoryGirl.create(:project, name: "text2")

		FactoryGirl.create(:ticket, project: text2, title: "Go biaches", description: "fuck yeah, fuck yeah and fuck yeah all")

		visit '/'
	end

	scenario "Viewing tickets for a given project" do 
		click_link "Fuck you"

		expect(page).to have_content("Yo biaches")
		expect(page).to_not have_content("Go biaches")

		click_link "Yo biaches"
		within("#ticket h2") do
			expect(page).to have_content("Yo biaches")
		end

		expect(page).to have_content("get the fuck out")
	end
end