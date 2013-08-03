# == Schema Information
#
# Table name: viewings
#
#  id                :integer          not null, primary key
#  office_listing_id :integer
#  date              :date
#  start_time        :time
#  end_time          :time
#  notes             :text
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Viewing do
  describe 'validations' do 
    let (:viewing) { create(:viewing) }
    it 'requires a start time' do
      viewing.should be_valid
      viewing.start_time = nil
      viewing.should_not be_valid
    end
    it 'requires and end time' do
      viewing.should be_valid
      viewing.end_time = nil
      viewing.should_not be_valid
    end
    it 'requires a start date' do
      viewing.should be_valid
      viewing.date = nil
      viewing.should_not be_valid
    end
  end
end
