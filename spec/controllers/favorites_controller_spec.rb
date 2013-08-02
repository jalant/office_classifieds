require 'spec_helper'

describe FavoritesController do

  before (:each) do
    OfficeListing.any_instance.stub(:geocode).and_return([1, 1])
  end
  
  describe 'GET #index' do
    it 'shows all of a specific user favorites' do 
    	
    	office_listing_1 = create(:office_listing)
      office_listing_2 = create(:office_listing_2)
      office_listing_3 = create(:office_listing_3)
      
      renter = create(:renter)

      favorite_1 = create(:favorite)
			favorite_2 = create(:favorite_2)
      favorite_3 = create(:favorite_3)

      get :index, renter_id: renter.id 

      assigns(:favorites).should include(favorite_1, favorite_2)
      assigns(:favorites).should_not include(favorite_3)

    end
  end
end
