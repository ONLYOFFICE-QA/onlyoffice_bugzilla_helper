# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeBugzillaHelper::BugzillaHelper, '#update_bug' do
  let(:bugzilla) { described_class.new }
  let(:data) { bugzilla.bug_data(BUG_ID_TEST_STATUS) }

  before do
    bugzilla.update_bug(BUG_ID_TEST_STATUS, status: 'NEW')
  end

  it 'By default bug status is NEW' do
    expect(data['status']).to eq('NEW')
  end

  it 'By default bug resolution is empty' do
    expect(data['resolution']).to eq('')
  end

  describe 'After change to RESOLVED FIXED' do
    before do
      bugzilla.update_bug(BUG_ID_TEST_STATUS,
                          status: 'RESOLVED',
                          resolution: 'FIXED')
    end

    it 'After change status is Resolved' do
      expect(data['status']).to eq('RESOLVED')
    end

    it 'After change resolution is Fixed' do
      expect(data['resolution']).to eq('FIXED')
    end
  end
end
