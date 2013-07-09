require 'spec_helper'

describe Notification do
  subject(:notification) { create(:notification) }

  it 'requires a subject' do
    expect(subject).to be_valid
    subject.subject = nil
    expect(subject).to be_invalid
  end

  it 'requires a subject of less than 60 characters' do
    expect(subject).to be_valid
    subject.subject = "a" * 61
    expect(subject).to be_invalid
  end

  it 'requires a body of less than 300 characters' do
    expect(subject).to be_valid
    subject.body = "a" * 301
    expect(subject).to be_invalid
  end

  it 'can be marked as read' do
    subject.read.should be_false
    subject.mark_as_read
    subject.read.should be_true
  end

  it 'can be marked as unread' do
    subject.mark_as_read
    subject.read.should be_true
    subject.mark_as_unread
    subject.read.should be_false
  end
end
