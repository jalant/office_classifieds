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
