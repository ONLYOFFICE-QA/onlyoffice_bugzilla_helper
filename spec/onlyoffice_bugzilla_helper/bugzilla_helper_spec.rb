# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeBugzillaHelper::BugzillaHelper do
  let(:bugzilla) { described_class.new }

  it 'check status of bug' do
    expect(bugzilla.bug_status(10)).to eq('CLOSED')
  end

  it 'check bugzilla url is not nil' do
    expect(bugzilla.url).not_to be_nil
  end

  it 'BugzillaHelper.read_token raise correct exception if file not found' do
    expect { described_class.read_token(force_file_read: true, token_path: './foo') }
      .to raise_error(/No access token/)
  end
end
