require 'spec_helper'
include Warden::Test::Helpers

describe 'Favorites ' do
  before do
    @favorite = create(:favorite)
    @renter = create(:renter)
    login_as(@renter, :scope => :renter)
    OfficeListing.any_instance.stub(:geocode).and_return([1, 1])
    @neighborhood = create(:neighborhood)
    @office_listing = create(:office_listing)
  end

  describe 'GET /renters/:id/favorites' do
    it "shows a renter's favorites in an organized manner"  do
      visit renter_favorites_path(@renter)
      page.should have_css('.favorite-box')
      find('.favorite-box').should have_content(@office_listing.address)
      click_link(@office_listing.address)
      current_path.should eq neighborhood_office_listing_path(neighborhood_id: @office_listing.neighborhood.id, id: @office_listing.id)
    end

    it "shows a renter's appointments" do
      viewing = create(:viewing)
      viewing.reload
      @renter.add_appointment(viewing)
      visit renter_favorites_path(@renter)
      within '.appointments' do 
        click_link(@office_listing.address)
      end
      current_path.should eq neighborhood_office_listing_path(neighborhood_id: @office_listing.neighborhood.id, id: @office_listing.id)
    end
  end
end
