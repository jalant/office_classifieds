# == Schema Information
#
# Table name: preference_lists
#
#  id           :integer          not null, primary key
#  renter_id    :integer
#  min_price    :integer
#  max_price    :integer
#  min_sq_feet  :integer
#  max_sq_feet  :integer
#  kitchen      :boolean
#  reception    :boolean
#  light        :boolean
#  shower       :boolean
#  high_ceiling :boolean
#  move_in      :boolean
#  patio        :boolean
#  furniture    :boolean
#  created_at   :datetime
#  updated_at   :datetime
#  email        :boolean
#

require 'spec_helper'

describe PreferenceList do
  subject(:preference_list) { create(:preference_list) }

  it 'defaults boolean values to false before save' do
    expect(subject.kitchen).to be_false
    expect(subject.reception).to be_false
    expect(subject.light).to be_false
    expect(subject.shower).to be_false
    expect(subject.high_ceiling).to be_false
    expect(subject.move_in).to be_false
    expect(subject.patio).to be_false
    expect(subject.furniture).to be_false
    expect(subject.email).to be_false
  end
end
