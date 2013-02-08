require 'spec_helper'

feature "Deleting Projects"  do
  scenario "Deleting a project" do
    Factory(:project, :name => "Text Mate 2")
    visit "/"
    click_link "Text Mate 2"
    click_link "Delete Project"
    page.should have_content("Project has been deleted.")

    visit "/"
    page.should_not have_content("Text Mate 2")
  end
end