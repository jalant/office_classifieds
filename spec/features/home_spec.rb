require 'spec_helper'

describe 'Home' do

  let(:city) {create(:city)}

  describe 'GET /' do
    it 'displays the HOME page with the navbar' do
      visit root_path
      page.should have_selector('nav')
      find('nav').should have_content('Browse Offices')
      page.should have_selector('#nav-signup')
      page.find('#nav-login').should have_content('Login')
      page.should have_selector('.final-signup')
      find('#nav-signup').should have_content('Sign Up')
      find('.final-signup').should have_content('Sign Up Today')
    end

    it 'navigates to individual city' do
      
      visit root_path
      save_and_open_page
      city.reload
      find('.dropdown li:nth-child(3) a').click
      current_path.should eq "/cities/2"
    end

    it 'login button shows two buttons for renter and broker' do
      pending
      visit root_path
      find('.login-div.button').click
    end

    it 'signup button shows two buttons for renter and broker' do
      pending
      visit root_path
      click_link('Login')
      page.should have_selector('.signup')
    end

    it 'renter can enter text into the renter login modal input form' do
      Capybara.default_wait_time = 5
      Capybara.reset_sessions!
      visit root_path
      within('form#renter_sign_in') do
        find_field('renter_email').value.should_not eq 'David'
        fill_in('renter_email', :with => 'David')
        find_field('renter_email').value.should eq 'David'
      end
    end

    it 'renter signup button displays the renter signup modal' do
      pending
      visit root_path
      click_link('Sign Up')
      click_link('Renter Signup')
      current_path.should eq new_renter_registration_path
    end


    it 'broker can enter text into the broker login modal input form' do
      Capybara.default_wait_time = 5
      Capybara.reset_sessions!
      visit root_path
      within('form#broker_sign_in') do
        find_field('broker_password').value.should_not eq 'mypassword'
        fill_in('broker_email', :with => 'mypassword')
        find_field('broker_email').value.should eq 'mypassword'
      end
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
