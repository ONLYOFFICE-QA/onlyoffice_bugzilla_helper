require 'spec_helper'

RSpec.describe OnlyofficeBugzillaHelper::BugzillaHelper, '#update_bug' do
  let(:bugzilla) { described_class.new }

  before do
    bugzilla.update_bug(BUG_ID_TEST_STATUS, status: 'NEW')
  end

  it 'Change status to RESOLVED FIXED' do
    data = bugzilla.bug_data(BUG_ID_TEST_STATUS)
    expect(data['status']).not_to eq('RESOLVED')
    expect(data['resolution']).not_to eq('FIXED')

    bugzilla.update_bug(BUG_ID_TEST_STATUS,
                        status: 'RESOLVED',
                        resolution: 'FIXED')
    data = bugzilla.bug_data(BUG_ID_TEST_STATUS)
    expect(data['status']).to eq('RESOLVED')
    expect(data['resolution']).to eq('FIXED')
  end
end
