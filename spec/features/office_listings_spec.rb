require 'spec_helper'

describe 'OfficeListings' do
  let(:neighborhood) { create(:neighborhood) } 
  let(:city) { create(:city) }
  let(:broker) { create(:broker) }
  let(:office_listing) { create(:office_listing) }

  before do
    broker.reload
    office_listing.reload
  end

  describe 'GET cities/:city_id/neighborhoods' do
    it 'displays a mini google map' do 
      office_listing.reload
      visit city_neighborhood_office_listing_path(neighborhood, neighborhood_id: neighborhood.id, city_id: city.id)
      page.should have_css('div#map-canvas')
    end

    it 'displays the price, square footage, and lease type of a listing' do
      visit city_neighborhood_office_listing_path(neighborhood, neighborhood_id: neighborhood.id, city_id: city.id)
      find('#rent').should have_content(office_listing.rent)
      find('#size').should have_content(office_listing.size)
      find('#lease-type').should have_content(office_listing.office_type)
    end
      
    it 'displays a list of amenities and adds a class of true if true in db' do
      visit city_neighborhood_office_listing_path(neighborhood, neighborhood_id: neighborhood.id, city_id: city.id)
      page.should have_css('.kitchen.true')
      page.should have_css('.light.true')
      page.should have_css('.patio.true')
      page.should have_css('.reception')
      page.should have_css('.shower')
      page.should have_css('.high_ceiling')
      page.should have_css('.patio')
      page.should_not have_css('.reception.true')
      page.should_not have_css('.shower.true')
    end
    it 'displays the name and contact information of the broker' do
      visit city_neighborhood_office_listing_path(neighborhood, neighborhood_id: neighborhood.id, city_id: city.id)
      find('div#broker-name').should have_content(office_listing.broker.first_name)
      find('div#broker-email').should have_content(office_listing.broker.email)
    end
  end
end
