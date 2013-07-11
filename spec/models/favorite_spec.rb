# == Schema Information
#
# Table name: favorites
#
#  id                :integer          not null, primary key
#  renter_id         :integer
#  office_listing_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'spec_helper'

describe Favorite do
	subject(:favorite) {create(:favorite)}

	describe 'associations' do
		it 'has a renter' do
			 expect(subject).to respond_to(:renter)
		end
		it 'has an office listing' do
			 expect(subject).to respond_to(:office_listing)
		end
		
	end 
end
