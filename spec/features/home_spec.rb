require 'spec_helper'

describe 'Home' do

  let(:city) {create(:city)}
  let(:city2) {create(:city2)}
  let(:city3) {create(:city3)}
  let(:city4) {create(:city4)}

  describe 'GET /' do
    it 'displays the HOME page with the navbar' do
      save_and_open_page
      visit root_path
      page.should have_selector('nav')
      find('nav').should have_content('Browse Offices')
      page.should have_selector('.success.button')
      find('.alert').should have_content('Login')
      page.should have_selector('.alert.button')
      find('.success').should have_content('Sign Up')
    end

    it 'navigates to individual city' do
      clink_link("New York")
      current_path.should eq "/cities/1"
    end
  end

end
