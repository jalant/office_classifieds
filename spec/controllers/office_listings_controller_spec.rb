require 'spec_helper'

describe OfficeListingsController do
  before do
    OfficeListing.any_instance.stub(:geocode).and_return([1, 1])
  end

  describe 'GET #index' do
    it 'gets all of the neighborhoods' do
      neighborhood = create(:neighborhood)
      city = create(:city)
      office_listing_1 = create(:office_listing)
      office_listing_2 = create(:office_listing_2)
      office_listing_3 = create(:office_listing_3)
      office_listing_4 = create(:office_listing_4)
      office_listing_5 = create(:office_listing_5)

      get :index, :neighborhood_id => neighborhood.id, :city_id => city.id
      assigns(:office_listings).should include(office_listing_1, office_listing_2, office_listing_3, office_listing_4)
      assigns(:office_listings).should_not include(office_listing_5)
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


    it 'renders the :new view' do
      get :new, :city_id => city.id, :neighborhood_id => neighborhood.id
      response.should render_template :new 
    end
  end

  describe 'GET #brokers_listings' do
    let(:broker) { mock_model(Broker).as_null_object }
    let(:listing_1) { mock_model(OfficeListing).as_null_object } 
    let(:listing_2) { mock_model(OfficeListing).as_null_object } 
    let(:viewing) { mock_model(Viewing).as_null_object }
    
    before do
      Broker.stub(:find).and_return(broker)
      OfficeListing.stub(:where).and_return([listing_1, listing_2])
      Viewing.stub(:new).and_return(viewing)
      get :brokers_listings, broker_id: 1
    end
    it 'should have a broker' do
      assigns(:broker).should eq(broker)
    end
    it 'should have a list of office listings' do
      assigns(:listings).should eq([listing_1, listing_2])
    end
    it 'should have a viewing' do
      assigns(:viewing).should eq(viewing)
    end
  end

  describe 'POST #create' do
    let(:city) { create(:city) }
    let(:neighborhood) { create(:neighborhood) } 
    let(:office_listing) { mock_model(OfficeListing).as_null_object  }
    before do
      OfficeListing.any_instance.stub(:geocode).and_return([1, 1])
      OfficeListing.stub(:new).and_return(office_listing)
    end

    context 'with valid attributes' do 
      it 'saves the listing' do 
        office_listing.stub(:save).and_return(true)
        office_listing.should_receive(:save)
        post :create, :city_id => city.id, :neighborhood_id => neighborhood.id
      end
    end

    context 'with invalid attributes' do
      it 'fails and renders new page' do
        office_listing.stub(:save).and_return(false)
        post :create, :city_id => city.id, :neighborhood_id => neighborhood.id
        assigns(:failure).should_not be_nil
      end
    end
  end
end
