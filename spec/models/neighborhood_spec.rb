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
