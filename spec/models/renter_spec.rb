# == Schema Information
#
# Table name: renters
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  address                :text
#  phone_number           :string(255)
#  img_url                :string(255)
#

require 'spec_helper'

describe Renter do
  subject(:renter) {create(:renter)}

  describe 'validation' do
    
  
 
    it 'requires a email' do
      expect(subject).to be_valid
      subject.email = nil
      expect(subject).to be_invalid
    end
    it 'requires a password' do
      expect(subject).to be_valid
      subject.password = nil
      expect(subject).to be_invalid
    end
    it 'requires a password confirmation' do
      expect(subject).to be_valid
      subject.password_confirmation = nil
      expect(subject).to be_invalid
    end

  end

  describe 'associations' do
    it 'has many favorites' do
    	expect(subject).to respond_to(:favorites)
    end
    it 'has office listings' do
      subject.office_listings.should eq []
      expect(subject).to respond_to(:office_listings)
    end
  end

  describe 'appointments' do
    let(:viewing) { create(:viewing) }
    
    it 'can add an appointment and have associated viewings' do
      subject.add_appointment(viewing)
      expect(subject.viewings).to include(viewing)
      expect(subject.appointments.first.viewing_id).to eq(viewing.id)
      expect(subject.appointments.first.renter_id).to eq(renter.id)
    end

    it 'can delete an appointment and its associated viewing' do
      subject.add_appointment(viewing)
      subject.remove_appointment(viewing)
      expect(subject.viewings).to be_empty
      expect(subject.appointments).to be_empty
      expect(viewing).to_not be_nil
    end
  end
end
