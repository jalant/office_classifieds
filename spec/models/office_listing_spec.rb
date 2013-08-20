# == Schema Information
#
# Table name: office_listings
#
#  id                     :integer          not null, primary key
#  address                :string(255)
#  office_type            :string(255)
#  size                   :integer
#  rent                   :integer
#  details                :text
#  kitchen                :boolean          default(FALSE)
#  reception              :boolean          default(FALSE)
#  light                  :boolean          default(FALSE)
#  shower                 :boolean          default(FALSE)
#  move_in                :boolean          default(FALSE)
#  high_ceiling           :boolean          default(FALSE)
#  patio                  :boolean          default(FALSE)
#  furniture              :boolean          default(FALSE)
#  term_length            :string(255)
#  availability           :string(255)
#  no_of_offices          :integer
#  no_of_conference_rooms :integer
#  neighborhood_id        :integer
#  broker_id              :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  latitude               :float
#  longitude              :float
#

require 'spec_helper'

describe OfficeListing do
  let(:office) { create(:office_listing) }
  let(:renter) {create(:renter)} 
  let(:renter2) {create(:renter2)} 

  before (:each) do
    OfficeListing.any_instance.stub(:geocode).and_return([1, 1])
    OfficeListing.any_instance.stub(:send_notifications)
  end
  

  it 'requires an address' do
    office.should be_valid
    office.address = nil
    office.should be_invalid
  end

  it 'requires an office type' do
    office.should be_valid
    office.office_type = nil
    office.should be_invalid
  end

  it 'requires a size' do
    office.should be_valid
    office.size = nil
    office.should be_invalid
  end

  it 'requires a rental rate' do
    office.should be_valid
    office.rent = nil
    office.should be_invalid
  end
  it 'requires a term length' do
    office.should be_valid
    office.term_length = nil
    office.should be_invalid
  end

  it 'requires an availability description' do
    office.should be_valid
    office.availability = nil
    office.should be_invalid
  end

  it 'requires size to be an integer' do
    office.should be_valid
    office.size = 'hello'
    office.should be_invalid
  end

  it 'requires rent to be an integer' do
    office.should be_valid
    office.rent = 'hello'
    office.should be_invalid
  end

  it 'requires a neighborhood id' do
    office.should be_valid
    office.neighborhood_id = nil
    office.should be_invalid
  end

  it 'requires a broker id' do
    office.should be_valid
    office.broker_id = nil
    office.should be_invalid
  end

  it "can add itself to a current user's favorites" do
    office.renters.size.should eq 0
    office.add_favorite(renter)
    office.renters.should include(renter)
    office.renters.size.should eq 1
    office.add_favorite(renter2)
    office.renters.size.should eq 2 
    renter.favorites.first.should eq Favorite.first   
  end

  it "can remove itself from a current user's favorites" do
    office.add_favorite(renter)
    office.renters.size.should eq 1
    office.remove_favorite(renter)
    office.renters.should_not include(renter)
    office.renters.size.should eq 0
  end

  describe 'viewing' do
    let(:viewing) { create(:viewing) }
    it 'can add a viewing' do
      office.add_viewing(viewing)
      office.viewings.should include(viewing)
      office.viewings.first.office_listing_id.should eq (office.id)
    end
  end

  describe 'preference list' do
    let(:preference_list) { create(:preference_list) }

    context 'office listing has a neighborhood matching preference list' do
      it 'checks whether its neighborhood matches the preferences of any renters with notifications enabled' do
        neighborhood_1 = create(:neighborhood)
        neighborhood_2 = create(:neighborhood_2)
        neighborhood_3 = create(:neighborhood_3)
        neighborhood_4 = create(:neighborhood_4)
        renter.add_preference_list(preference_list)
        preference_list.neighborhoods << neighborhood_1 << neighborhood_2 << neighborhood_3
        office.check_for_matching_neighborhood(renter.preference_list.neighborhoods).should be_true
        # test opposite
        office.neighborhood = neighborhood_4
        office.check_for_matching_neighborhood(preference_list.neighborhoods).should be_false
      end
    end

    context 'office listing does not have a neighborhood matching preference list' do
      it 'checks whether its neighborhood matches the preferences of any renters with notifications enabled' do
        neighborhood_1 = create(:neighborhood)
        neighborhood_2 = create(:neighborhood_2)
        neighborhood_3 = create(:neighborhood_3)
        renter.add_preference_list(preference_list)
        office.neighborhood = neighborhood_3
        preference_list.neighborhoods << neighborhood_1 << neighborhood_2
        office.check_for_matching_neighborhood(renter.preference_list.neighborhoods).should be_false
        # test opposite 
        office.neighborhood = neighborhood_1
        office.check_for_matching_neighborhood(renter.preference_list.neighborhoods).should be_true
      end

      it 'returns true for an empty neigborhood list when checking for matching neighbhorhood' do
        renter.add_preference_list(preference_list)
        office.check_for_matching_neighborhood(renter.preference_list.neighborhoods).should be_true
      end
    end

    context 'office listing has a broker matching preference list' do
      it 'checks whether its broker matches the preferences of any renters with notifications enabled' do
        broker_1 = create(:broker)
        broker_2 = create(:broker_2)
        broker_3 = create(:broker_3)
        broker_4 = create(:broker_4)
        renter.add_preference_list(preference_list)
        preference_list.brokers << broker_1 << broker_2 << broker_3
        office.check_for_matching_broker(renter.preference_list.brokers).should be_true
        # test opposite
        office.broker = broker_4
        office.check_for_matching_broker(preference_list.brokers).should be_false
      end
    end

    context 'office listing does not have a broker matching preference list' do
      it 'checks whether its broker matches the preferences of any renters with notifications enabled' do
        broker_1 = create(:broker)
        broker_2 = create(:broker_2)
        broker_3 = create(:broker_3)
        renter.add_preference_list(preference_list)
        office.broker = broker_3
        preference_list.brokers << broker_1 << broker_2
        office.check_for_matching_broker(renter.preference_list.brokers).should be_false
        # test opposite 
        office.broker = broker_1
        office.check_for_matching_broker(renter.preference_list.brokers).should be_true
      end

      it 'returns true for an empty broker list' do
        renter.add_preference_list(preference_list)
        office.check_for_matching_broker(renter.preference_list.brokers).should be_true
      end
    end

    context 'check amenity when listing has an amenity' do
      it 'checks if a listing has an amenity  if a preference list has specified it to' do
        office.kitchen = true
        office.check_matching_amenity(preference_list.kitchen, :kitchen).should be_true
        preference_list.kitchen = true
        office.check_matching_amenity(preference_list.kitchen, :kitchen).should be_true
        office.reception = true
        preference_list.reception = true
        office.check_matching_amenity(preference_list.reception, :reception).should be_true
        office.patio = true
        preference_list.patio = true
        office.check_matching_amenity(preference_list.patio, :patio).should be_true
        office.furniture = true
        preference_list.furniture = true
        office.check_matching_amenity(preference_list.furniture, :furniture).should be_true
      end
    end

    context 'check amenity when listing does not have a amenity' do 
      it 'checks if a listing has an amenity if a preference list has specified it to' do
        office.check_matching_amenity(preference_list.kitchen, :kitchen).should be_true
        office.kitchen = false
        preference_list.kitchen = true
        office.check_matching_amenity(preference_list.kitchen, :kitchen).should be_false
        office.check_matching_amenity(preference_list.light, :light).should be_true
        office.light = false
        preference_list.light = true
        office.check_matching_amenity(preference_list.light, :light).should be_false
        office.check_matching_amenity(preference_list.shower, :shower).should be_true
        office.shower = false
        preference_list.shower = true
        office.check_matching_amenity(preference_list.shower, :shower).should be_false
        office.check_matching_amenity(preference_list.high_ceiling, :high_ceiling).should be_true
        office.high_ceiling = false
        preference_list.high_ceiling = true
        office.check_matching_amenity(preference_list.high_ceiling, :high_ceiling).should be_false
      end
    end

    context 'save with listing matching a renter preference neighborhood' do
      let(:office_listing_2) { build(:office_listing_2) }
      let(:neighborhood) { create(:neighborhood) }
      let(:neighborhood_2) { create(:neighborhood_2) }
      let(:broker) { create(:broker) }
      let(:broker_2) { create(:broker_2) }
      
      before do
        pusher = mock_model(OfficeListing).as_null_object # this isn't good, should be an instance of Pusher, not OfficeListing
        Pusher.stub(:[]).and_return(pusher)
        OfficeListing.any_instance.stub(:trigger)
        OfficeListing.any_instance.unstub(:send_notifications)
      end

      it 'creates a single notification for the renter with matching neighborhoods' do
        office_listing_2.neighborhood = neighborhood_2
        preference_list.neighborhoods << neighborhood << neighborhood_2
        renter.add_preference_list(preference_list)
        renter.preference_list.activated = true
        renter.preference_list.save
        expect{ office_listing_2.save }.to change{Notification.count}.by(1)
        Notification.all.first.renter_id.should eq(renter.id)
      end

      it 'creates two notifications for two renters with matching neighborhoods' do
        preference_list_2 = create(:preference_list_2)
        office_listing_2.neighborhood = neighborhood_2
        preference_list.neighborhoods << neighborhood << neighborhood_2
        preference_list_2.neighborhoods << neighborhood << neighborhood_2
        renter.add_preference_list(preference_list)
        renter2.add_preference_list(preference_list_2)
        renter.preference_list.activated = true
        renter2.preference_list.activated = true
        renter.preference_list.save
        renter2.preference_list.save
        expect{ office_listing_2.save }.to change{Notification.count}.by(2)
        Notification.all.first.renter_id.should eq(renter.id)
        Notification.all[1].renter_id.should eq (renter2.id)
      end

      it 'creates zero notifications for two renters with no matching neighborhoods' do
        neighborhood_3 = create(:neighborhood_3)
        preference_list_2 = create(:preference_list_2)
        office_listing_2.neighborhood = neighborhood_3
        preference_list.neighborhoods << neighborhood << neighborhood_2
        preference_list_2.neighborhoods << neighborhood << neighborhood_2
        renter.add_preference_list(preference_list)
        renter2.add_preference_list(preference_list_2)
        renter.preference_list.activated = true
        renter2.preference_list.activated = true
        expect{ office_listing_2.save }.to change{Notification.count}.by(0)
      end
    end

    context 'save with listing matching a renter preference broker' do
      let(:office_listing_2) { build(:office_listing_2) }
      let(:broker) { create(:broker) }
      let(:broker_2) { create(:broker_2) }
      let(:broker) { create(:broker) }
      let(:broker_2) { create(:broker_2) }
      let(:neighborhood) { create(:neighborhood) }
      
      before do
        OfficeListing.any_instance.unstub(:send_notifications)
        pusher = mock_model(OfficeListing).as_null_object # this isn't good, should be an instance of Pusher, not OfficeListing
        Pusher.stub(:[]).and_return(pusher)
        OfficeListing.any_instance.stub(:trigger)
        office_listing_2.neighborhood = neighborhood
      end

      it 'creates a single notification for the renter with matching brokers' do
        office_listing_2.broker = broker_2
        preference_list.brokers << broker << broker_2
        renter.add_preference_list(preference_list)
        renter.preference_list.activated = true
        renter.preference_list.save
        expect{ office_listing_2.save }.to change{Notification.count}.by(1)
        Notification.all.first.renter_id.should eq(renter.id)
      end

      it 'creates two notifications for two renters with matching brokers' do
        preference_list_2 = create(:preference_list_2)
        office_listing_2.broker = broker_2
        preference_list.brokers << broker << broker_2
        preference_list_2.brokers << broker << broker_2
        renter.add_preference_list(preference_list)
        renter2.add_preference_list(preference_list_2)
        renter.preference_list.activated = true
        renter2.preference_list.activated = true
        renter.preference_list.save
        renter2.preference_list.save
        expect{ office_listing_2.save }.to change{Notification.count}.by(2)
        Notification.all.first.renter_id.should eq(renter.id)
        Notification.all[1].renter_id.should eq (renter2.id)
      end

      it 'creates zero notifications for two renters with no matching brokers' do
        broker_3 = create(:broker_3)
        preference_list_2 = create(:preference_list_2)
        office_listing_2.broker = broker_3
        preference_list.brokers << broker << broker_2
        preference_list_2.brokers << broker << broker_2
        renter.add_preference_list(preference_list)
        renter2.add_preference_list(preference_list_2)
        renter.preference_list.activated = true
        renter2.preference_list.activated = true
        renter.preference_list.save
        renter2.preference_list.save
        expect{ office_listing_2.save }.to change{Notification.count}.by(0)
      end
    end

    context 'save with listing matching a combination of user preferences' do
      let(:office_listing_2) { build(:office_listing_2) }
      let(:broker) { create(:broker) }
      let(:broker_2) { create(:broker_2) }
      let(:neighborhood) { create(:neighborhood) }
      let(:neighborhood_2) { create(:neighborhood_2) }
      let(:neighborhood_3) { create(:neighborhood_3) }

      before do
        OfficeListing.any_instance.unstub(:send_notifications)
        pusher = mock_model(OfficeListing).as_null_object # This isn't good -- should be an instance of Pusher
        Pusher.stub(:[]).and_return(pusher)
        OfficeListing.any_instance.stub(:trigger)
        office_listing_2.neighborhood = neighborhood
      end


      it 'creates a single notification for the renter with matching preferences' do
        office_listing_2.broker = broker_2
        office_listing_2.light = true
        office_listing_2.reception = true
        preference_list.light = true
        preference_list.reception = true
        preference_list.brokers << broker_2 << broker
        preference_list.neighborhoods << neighborhood_2 << neighborhood
        renter2.add_preference_list(preference_list)
        renter2.preference_list.activated = true
        renter2.preference_list.save
        expect { office_listing_2.save }.to change{Notification.count}.by(1)
        Notification.all.first.office_listing_id.should eq(office_listing_2.id)
        Notification.all.first.renter_id.should eq(renter2.id)
      end
      it 'does not create any new notifications when the renter does not have matching preferences' do
        office_listing_2.broker = broker_2
        office_listing_2.light = true
        office_listing_2.reception = false
        preference_list.light = true
        preference_list.reception = true
        preference_list.brokers << broker_2 << broker
        preference_list.neighborhoods << neighborhood_2 << neighborhood
        renter2.add_preference_list(preference_list)
        renter2.preference_list.activated = true
        renter2.preference_list.save
        expect { office_listing_2.save }.to change{Notification.count}.by(0)
      end
    end
  end
end
