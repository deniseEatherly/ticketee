require 'spec_helper'

feature "Creating Projects" do
  before do
    visit "/"
    click_link "New Project"
  end
  scenario "can create a project" do

    fill_in "Name", :with  =>  "Text Mate 2"
    fill_in "Description", :with => "A text editor for OSX"
    click_button "Create Project"
    page.should have_content("Project has been created.")
    project = Project.find_by_name("Text Mate 2")
    page.current_url.should == project_url(project)
    title = "Text Mate 2 - Projects - Ticketee"
    find('title').should have_content(title)
  end

  scenario "cannot create a project without a name" do
    click_button "Create Project"
    page.should have_content("Project can not be created.")
    page.should have_content("Name can't be blank")
  end
end