# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  img        :string(255)
#

require 'spec_helper'

describe City do
  subject(:city) {create(:city)}

  describe 'validation' do
    it 'has a name' do
      expect(subject).to be_valid
      subject.name = nil
      expect(subject).to be_invalid
    end

    it 'has an image' do
      expect(subject).to be_valid
      subject.img = nil
      expect(subject).to be_invalid
    end
  end

  describe 'associations' do
    it 'has many neighborhoods' do
      expect(subject).to respond_to(:neighborhoods)
    end

    it 'has many office listings' do
      expect(subject).to respond_to(:office_listings)
    end
  end
end
