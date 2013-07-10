require 'spec_helper'
include Warden::Test::Helpers

describe 'Favorites ' do
  before do
    @favorite = create(:favorite)
    @renter = create(:renter)
    login_as(@renter, :scope => :renter)
    @office_listing = create(:office_listing)
  end

  describe 'GET /renters/:id/favorites' do
    it "shows a renter's favorites in an organized manner"  do
      visit renter_favorites_path(@renter)
      page.should have_css('.ind-office')
      find('.ind-office').should have_content(@office_listing.address)
    end
  end
end
