require 'spec_helper'

describe Broker do
  subject(:broker) {create(:broker)}

  describe 'validation' do
    it 'requires a first name' do
      expect(subject).to be_valid
      subject.first_name = nil
      expect(subject).to be_invalid
    end
    it 'requires a last name' do
      expect(subject).to be_valid
      subject.last_name = nil
      expect(subject).to be_invalid
    end
    it 'requires a phone number' do
      expect(subject).to be_valid
      subject.phone_number = nil
      expect(subject).to be_invalid
    end
    it 'requires an img_url' do
      expect(subject).to be_valid
      subject.img_url = nil
      expect(subject).to be_invalid
    end
    it 'requires an address' do
      expect(subject).to be_valid
      subject.address = nil
      expect(subject).to be_invalid
    end
    it 'requires a firm' do
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
      expect(subject).to be_valid
      subject.password = nil
      expect(subject).to be_invalid
    end
    it 'requires a password confirmation' do
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