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
  
  describe 'GET #new' do
    let (:favorite) { mock_model(Favorite).as_null_object }
    let(:renter) { mock_model(Renter).as_null_object }
    
    it 'saves a new viewing as an instance variable' do
      get :new, :renter_id => renter.id, id: favorite.id
      assigns(:favorite).should be_instance_of Favorite
      assigns(:favorite).should be_new_record
    end
  end

  describe 'POST #create' do
    let(:renter) { mock_model(Renter.as_null_object) }
    let(:favorite) { mock_model(Favorite).as_null_object }
    
    before do 
      Favorite.stub(:new).and_return(favorite)
    end

    describe 'with valid attributes' do
      it 'saves the favorite' do 
        favorite.stub(:save).and_return(true)
        favorite.should_receive(:save)
        post :create, renter_id: renter.id
      end
    end

    describe 'with invalid attributes' do
      it 'fails and renders a failure message' do
        favorite.stub(:save).and_return(false)
        favorite.should_receive(:save)
        post :create, :renter_id => renter.id
        assigns(:failure_message).should_not be_nil
      end
    end
  end

  describe 'DELETE #destroy' do
     let(:renter) { mock_model(Renter.as_null_object) }
     let(:favorite) { mock_model(Favorite).as_null_object }

    it 'deletes a viewing' do
      Favorite.stub(:find).and_return(favorite)
      controller.stub(:current_renter).and_return(renter)
      renter.stub(:remove_favorite)
      renter.should_receive(:remove_favorite)
      favorite.should_receive(:destroy)
      delete :destroy, id: favorite, renter_id: renter.id
    end
  end
end
