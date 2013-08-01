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
end
