require 'spec_helper'

describe 'Home' do

  describe 'GET /' do
    it 'displays the HOME page with the navbar' do
      visit root_path
      page.should have_selector('nav')
      find('nav').should have_content('Browse Offices')
      page.should have_selector('.success.button')
      find('.alert').should have_content('Login')
      page.should have_selector('.alert.button')
      find('.success').should have_content('Sign Up')
  
    end
  end

end
