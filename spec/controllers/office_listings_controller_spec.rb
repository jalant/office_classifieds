require 'spec_helper'

describe OfficeListingsController do
  describe 'GET #index' do
    it 'gets all of the neighborhoods' do
      neighborhood = create(:neighborhood)
      city = create(:city)
      office_listing_1 = create(:office_listing)
      office_listing_2 = create(:office_listing_2)
      office_listing_3 = create(:office_listing_3)
      office_listing_4 = create(:office_listing_4)
      get :index, :neighborhood_id => neighborhood.id, :city_id => city.id
      assigns(:office_listings).should include(office_listing_1, office_listing_2, office_listing_3)
      assigns(:office_listings).should_not include(office_listing_4)
    end

    it 'renders the index view' do
      city = create(:city)
      neighborhood = create(:neighborhood)
      office_listing_1 = create(:office_listing)
      get :index, :city_id => city.id, :neighborhood_id => neighborhood.id
      response.should render_template :index
    end
  end

  describe 'GET #new' do
    let(:city) { create(:city) }
    let(:neighborhood) { create(:neighborhood) } 
    let (:office_listing) { mock_model(OfficeListing).as_new_record }

    before do
      OfficeListing.stub(:new).and_return(office_listing)
    end

    it 'saves a new office listing as an instance variable' do
      get :new, :city_id => city.id, :neighborhood_id => neighborhood.id
      assigns(:office_listing).should be_instance_of OfficeListing
      assigns(:office_listing).should be_new_record
    end

    it 'renders the :new view' do
      get :new, :city_id => city.id, :neighborhood_id => neighborhood.id
      response.should render_template :new 
    end
  end

  describe 'POST #create' do
    let(:city) { create(:city) }
    let(:neighborhood) { create(:neighborhood) } 
    let (:office_listing) { mock_model(OfficeListing).as_null_object }

    before do
      OfficeListing.stub(:create).and_return(office_listing)
    end

    context 'with valid attributes' do 
      it 'saves the listing' do
        office_listing.should_receive(:save)
        post :create, :city_id => city.id, :neighborhood_id => neighborhood.id
      end

      it "redirects to broker's listing index" do
        pending
      end
    end

    context 'with invalid attributes' do
      it 'fails and renders new page' do
        office_listing.should_receive(:save).and_return(false)
        post :create, :city_id => city.id, :neighborhood_id => neighborhood.id
        response.should redirect_to new_city_neighborhood_office_listing_path
      end
    end


      
  end

end
