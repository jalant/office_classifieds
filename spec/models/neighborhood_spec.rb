# == Schema Information
#
# Table name: neighborhoods
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  img_url    :string(255)
#  latitude   :float
#  longitude  :float
#  address    :text
#

require 'spec_helper'

describe Neighborhood do
  subject(:neighborhood) { create(:neighborhood) }
  it 'requires a name' do
    expect(subject).to be_valid
    subject.name = nil
    expect(subject).to be_invalid
  end

  it 'must have a name between 3 and 50 characters' do
    expect(subject).to be_valid
    subject.name = 'a' * 2
    expect(subject).to be_invalid
    subject.name = 'a' * 51 
    expect(subject).to be_invalid
  end
end
