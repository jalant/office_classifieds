require 'spec_helper'

describe 'Home' do

  let(:city) {create(:city)}

  describe 'GET /' do
    it 'displays the HOME page with the navbar' do
      visit root_path
      page.should have_selector('nav')
      find('nav').should have_content('Browse Offices')
      page.should have_selector('.success.button')
      find('.main.alert').should have_content('Login')
      page.should have_selector('.alert.button')
      find('.main.success').should have_content('Sign Up')
    end

    it 'navigates to individual city' do
      visit root_path
      city.reload
      click_link("Singapore")
      current_path.should eq "/cities/1"
    end

    it 'login button shows two buttons for renter and broker' do
      visit root_path
      click_link('Login')
      page.should have_selector('.login')
    end

    it 'singup button shows two buttons for renter and broker' do
      visit root_path
      click_link('Login')
      page.should have_selector('.signup')
    end

    it 'renter login button displays the renter login page' do
      visit root_path
      click_link('Login')
      click_link('Renter Login')
      current_path.should eq new_renter_session_path
    end

    it 'renter signup button displays the renter signup page' do
      visit root_path
      click_link('Sign Up')
      click_link('Renter Signup')
      current_path.should eq new_renter_registration_path
    end


    it 'broker login button displays the broker login page' do
      visit root_path
      click_link('Login')
      click_link('Broker Login')
      current_path.should eq new_broker_session_path
    end

    it 'broker signup button displays the broker signup page' do
      visit root_path
      click_link('Sign Up')
      click_link('Broker Signup')
      current_path.should eq new_broker_registration_path
    end

  end
end
