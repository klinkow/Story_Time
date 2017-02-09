require 'rails_helper'

describe "the add a story process" do
  it "adds a new story" do
    visit users_path
    click_link 'Add New User'
    fill_in 'Name', :with => 'Jazzmaster'
    click_on 'Create User'
    click_on "Jazzmaster"
    click_on "Add New Story"
    fill_in 'Title', :with => "a wonderful tale"
    click_on 'Create Story'
    expect(page).to have_content 'a wonderful tale'
  end
end
