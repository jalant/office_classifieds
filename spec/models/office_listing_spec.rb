require 'spec_helper'

describe OfficeListing do
   let(:office) { create(:office_listing) }

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
end
