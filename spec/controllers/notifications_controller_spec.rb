require 'spec_helper'

describe NotificationsController  do

  let(:notification) { mock_model(Notification).as_null_object }
  before do 
    Notification.stub(:find_by_id).and_return(notification)
    Notification.any_instance.stub(:save).and_return(true)
  end
  describe "PATCH #update", :js => true do
    it 'marks a notification as read and saves it' do
      notification.should_receive(:save)
      xhr :patch, :update, id: 1
    end
  end
end
