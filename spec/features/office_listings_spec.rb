require 'spec_helper'
include Warden::Test::Helpers

describe 'OfficeListings' do
  let(:neighborhood) { create(:neighborhood) } 
  let(:city) { create(:city) }
  let(:broker) { create(:broker) }
  let(:office_listing) { create(:office_listing) }
  let(:image) { create(:image) }

  before do
    OfficeListing.any_instance.stub(:geocode).and_return([1, 1])
    broker.reload
    image.reload
    office_listing.reload
  end

  describe 'GET cities/:city_id/neighborhoods/:neighborhood_id/office_listings/' do
    it 'displays a list of all of the listings in a neighborhood' do
      office_listing_2 = create(:office_listing_2)
      office_listing_3 = create(:office_listing_3)
      office_listing_4 = create(:office_listing_4)
      visit neighborhood_office_listings_path(neighborhood_id: neighborhood.id)
      page.should have_content(office_listing.address)
      page.should have_content(office_listing_2.address)
      page.should have_content(office_listing_3.address)
      page.should have_content(office_listing_4.address)
    end

    it 'displays a list of amenities and adds a class of true if true in db' do
      visit neighborhood_office_listing_path(id: office_listing.id, neighborhood_id: neighborhood.id)
      page.should have_css('.kitchen_check.general.foundicon-checkmark')
      page.should have_css('.light_check.general.foundicon-checkmark')
      page.should have_css('.patio_check.general.foundicon-checkmark')
      page.should have_css('.reception_check.general.foundicon-remove')
      page.should have_css('.shower_check.general.foundicon-remove')
      page.should have_css('.ceiling_check.general.foundicon-checkmark')
      page.should_not have_css('.reception_check.general.foundicon-checkmark')
    end
  end

  describe 'GET cities/:city_id/neighborhoods/:neighborhood_id/office_listings/new' do
    it 'displays a form for creating office listing attributes' do
      city.reload
      visit new_neighborhood_office_listing_path(neighborhood_id: neighborhood.id)
      page.should have_css('#listing-attributes')
    end

    it 'creates a new office listing from the form' do

      city.reload
      visit new_neighborhood_office_listing_path(neighborhood_id: neighborhood.id)
      login_as(broker, :scope => :broker)
      fill_in('office_listing[address]', with: 'my address')
      fill_in('office_listing[rent]', with: '1234')
      fill_in('office_listing[size]', with: '3213')
      fill_in('office_listing[no_of_offices]', with: '23')
      fill_in('office_listing[no_of_conference_rooms]', with: '12')
      fill_in('office_listing[details]', with: '55')
      select('Lease', :from => 'Office type')
      select('Less than one year', :from => 'Term length')
      select('Immediate', :from => 'Availability')
      find(:css, '#amenities_[value="Reception"]').set(true)
      find(:css, '#amenities_[value="Light"]').set(true)
      find(".submit.button").click
      OfficeListing.count.should eq 2
      OfficeListing.last.reception.should be_true
      OfficeListing.last.light.should be_true
      OfficeListing.last.shower.should be_false
    end

    it 'has a hidden form for uploading images' do
      city.reload
      visit new_neighborhood_office_listing_path(neighborhood_id: neighborhood.id)
      page.should have_css('form.hidden#listing-images')
    end

    it 'unhides the images form and displays an image display div when the update attributes form is submitted' do

      city.reload
      visit new_neighborhood_office_listing_path(neighborhood_id: neighborhood.id)
      login_as(broker, :scope => :broker)
      fill_in('office_listing[address]', with: 'my address')
      fill_in('office_listing[rent]', with: '1234')
      fill_in('office_listing[size]', with: '3213')
      fill_in('office_listing[no_of_offices]', with: '23')
      fill_in('office_listing[no_of_conference_rooms]', with: '12')
      fill_in('office_listing[details]', with: '55')
      find(".submit.button").click
      page.should_not have_css('form.hidden#image-buttons')    
    end
  end
end
