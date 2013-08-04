require 'spec_helper'

describe ViewingsController do
  describe 'GET #new' do
    let (:office_listing) { mock_model(OfficeListing) }
    
    it 'saves a new viewing as an instance variable' do
      get :new, :office_listing_id => office_listing.id
      assigns(:viewing).should be_instance_of Viewing
      assigns(:viewing).should be_new_record
    end
  end

  describe 'POST #create' do
    let(:office_listing) { mock_model(OfficeListing.as_null_object) }
    let(:viewing) { mock_model(Viewing).as_null_object }
    
    before do 
      Viewing.stub(:new).and_return(viewing)
      OfficeListing.stub(:find).and_return(office_listing)
    end

    describe 'with valid attributes' do
      it 'saves the viewing' do 
        viewing.stub(:save).and_return(true)
        viewing.should_receive(:save)
        office_listing.should_receive(:add_viewing)
        post :create, office_listing_id: office_listing.id
      end
    end

    describe 'with invalid attributes' do
      it 'fails and renders a failure message' do
        viewing.stub(:save).and_return(false)
        viewing.should_receive(:save)
        office_listing.should_receive(:add_viewing)
        post :create, :office_listing_id => office_listing.id
        assigns(:failure_message).should_not be_nil
      end
    end
  end

  describe 'DELETE #destroy' do
     let(:office_listing) { mock_model(OfficeListing.as_null_object) }
     let(:viewing) { mock_model(Viewing).as_null_object }
     let(:broker) { mock_model(Broker).as_null_object }

    it 'deletes a viewing' do
      Viewing.stub(:find).and_return(viewing)
      controller.stub(:current_broker).and_return(broker)
      broker.stub(:remove_viewing)
      broker.should_receive(:remove_viewing)
      viewing.should_receive(:destroy)
      delete :destroy, id: viewing, office_listing_id: office_listing.id
    end
  end
end
