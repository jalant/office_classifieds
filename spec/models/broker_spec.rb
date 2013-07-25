# == Schema Information
#
# Table name: brokers
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
#  firm                   :string(255)
#

require 'spec_helper'

describe Broker do
  subject(:broker) {create(:broker)}

  describe 'validation' do
    it 'requires a first name' do
      pending
      expect(subject).to be_valid
      subject.first_name = nil
      expect(subject).to be_invalid
    end
    it 'requires a last name' do
      pending
      expect(subject).to be_valid
      subject.last_name = nil
      expect(subject).to be_invalid
    end
    it 'requires a phone number' do
      pending
      expect(subject).to be_valid
      subject.phone_number = nil
      expect(subject).to be_invalid
    end
    it 'requires an img_url' do
      pending
      expect(subject).to be_valid
      subject.img_url = nil
      expect(subject).to be_invalid
    end
    it 'requires an address' do
      pending
      expect(subject).to be_valid
      subject.address = nil
      expect(subject).to be_invalid
    end
    it 'requires a firm' do
      pending
      expect(subject).to be_valid
      subject.firm = nil
      expect(subject).to be_invalid
    end
    it 'requires a email' do
      expect(subject).to be_valid
      subject.email = nil
      expect(subject).to be_invalid
    end
    it 'requires a password' do
      pending
      expect(subject).to be_valid
      subject.password = nil
      expect(subject).to be_invalid
    end
    it 'requires a password confirmation' do
      pending
      expect(subject).to be_valid
      subject.password_confirmation = nil
      expect(subject).to be_invalid
    end
    it 'requires address to be less than 80 characters' do
      expect(subject).to be_valid
      subject.address = '1207 Dover Road, Singaproe, Singapore, Singapore, Singapore, Singapore, Singapore, Singapore, Singapore, Singapore'
      expect(subject).to be_invalid
    end
  end

   describe 'associations' do
    it 'has office listings' do
      subject.office_listings.should eq []
      expect(subject).to respond_to(:office_listings)
    end
  end

end
