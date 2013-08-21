require 'spec_helper'

describe AppointmentsController do
  describe 'GET #index' do
    let(:appointment_1) { mock_model(Appointment) }
    let(:appointment_2) { mock_model(Appointment) }
    let(:viewing_1) { mock_model(Viewing) }
    let(:viewing_2) { mock_model(Viewing) }
    before do
      Appointment.stub(:find_all_by_renter_id).and_return([appointment_1, appointment_2])
      appointment_1.stub(:viewing).and_return(viewing_1)
      appointment_2.stub(:viewing).and_return(viewing_2)
    end

    it 'creates a list of viewings' do
      xhr :get, :index, renter_id: 1
      assigns(:viewings).should eq([viewing_1, viewing_2])
    end
  end

  describe 'POST #create' do
    let(:renter) { mock_model(Renter.as_null_object) }
    let(:viewing) { mock_model(Viewing).as_null_object }
    
    before do 
      Viewing.stub(:find).and_return(viewing)
      Renter.stub(:find).and_return(renter)
      controller.stub(:current_renter).and_return(renter)
    end

    describe 'with valid attributes' do
      it 'adds a viewing to a renters appointments' do 
        renter.stub(:save).and_return(true)
        renter.should_receive(:add_appointment).with(viewing)
        renter.should_receive(:save)
        xhr :post, :create, renter_id: renter.id
      end
    end
  end

  describe 'DELETE #destroy' do
     let(:renter) { mock_model(Renter.as_null_object) }
     let(:viewing) { mock_model(Viewing).as_null_object }
     let(:appointment) { mock_model(Appointment).as_null_object }

    it 'deletes a viewing' do
      Viewing.stub(:find).and_return(viewing)
      controller.stub(:current_renter).and_return(renter)
      renter.stub(:remove_appointment)
      renter.should_receive(:remove_appointment).with(viewing)
      renter.should_receive(:save)
      xhr :delete, :destroy, id: appointment.id, renter_id: renter.id
    end
  end
end
