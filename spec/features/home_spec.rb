require 'spec_helper'

describe 'Home' do

  let(:city) {create(:city)}

  describe 'GET /' do
    it 'displays the HOME page with the navbar' do
      visit root_path
      page.should have_selector('nav')
      find('nav').should have_content('Browse Offices')
      page.should have_selector('#nav-signup')
      find('.login-div.button').should have_content('Login')
      page.should have_selector('.final-signup')
      find('#nav-signup').should have_content('Sign Up')
      find('.final-signup').should have_content('Sign Up Today')
    end

    it 'navigates to individual city' do
      pending
      visit root_path
      city.reload
      click_link("Singapore")
      current_path.should eq "/cities/1"
    end

    it 'login button shows two buttons for renter and broker' do
      pending
      visit root_path
      click_link('Login')
      page.should have_selector('.login')
    end

    it 'signup button shows two buttons for renter and broker' do
      pending
      visit root_path
      click_link('Login')
      page.should have_selector('.signup')
    end

    it 'renter login button displays the renter login modal' do
      visit root_path
      # find(:css, '#renter_sign_in').should_not be_visible
      page.should have_css('#renter_sign_in', :visible => true)
      find('.login-div.button').click
      find('#renter-login').click
      page.should have_css('#renter_sign_in', :visible => false)
      # page.find('#renter_sign_in.reveal-modal').should have_css(:visibility => 'visible')
    end

    it 'renter signup button displays the renter signup modal' do
      pending
      visit root_path
      click_link('Sign Up')
      click_link('Renter Signup')
      current_path.should eq new_renter_registration_path
    end


    it 'broker login button displays the broker login modal' do
      pending
      visit root_path
      click_link('Login')
      click_link('Broker Login')
      current_path.should eq new_broker_session_path
    end

    it 'broker signup button displays the broker signup modal' do
      pending
      visit root_path
      click_link('Sign Up')
      click_link('Broker Signup')
      current_path.should eq new_broker_registration_path
    end

    it 'signout button signs the current user out and redirects to home page' do
      pending
    end

  end
end
