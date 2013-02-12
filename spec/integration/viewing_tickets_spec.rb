require 'spec_helper'

feature "Viewing Tickets" do
  before do
    textmate_2 = Factory(:project, :name => "Text Mate 2")
    Factory(:ticket,
            :project => textmate_2,
            :title => "Make it shiney!",
            :description => "Gradients! Starbursts! Oh my!")
    internet_explorer = Factory(:project, :name => "Internet Explorer")
    Factory(:ticket,
            :project => internet_explorer,
            :title => "Standards Compliance",
            :description => "Isn't a joke.")
     visit "/"
  end

  scenario "viewing tickets for a given project" do
    click_link "Text Mate 2"
    page.should have_content("Make it shiney!")
    page.should_not have_content("Standards Compliance")
    click_link "Make it shiney!"
    within("#ticket h2") do
      page.should have_content("Make it shiney!")
    end
    page.should have_content("Gradients! Starbursts! Oh my!")
  end
end