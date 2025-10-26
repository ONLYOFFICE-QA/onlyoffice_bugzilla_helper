# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OnlyofficeBugzillaHelper::BugzillaHelper, '#bug_data' do
  let(:bugzilla) { described_class.new }

  it 'BugzillaHelper#bug_exists? correct for existing bug' do
    expect(bugzilla).to be_bug_exists(123_45)
  end

  it 'BugzillaHelper#bug_exists? correct for nonexisting bug' do
    expect(bugzilla).not_to be_bug_exists(123_457_891_011)
  end

  it 'BugzillaHelper#bug_data has summary' do
    data = bugzilla.bug_data(123_45)
    expect(data['summary']).not_to be_empty
  end

  it 'BugzillaHelper#bug_data has creator' do
    data = bugzilla.bug_data(123_45)
    expect(data['creator']).not_to be_empty
  end

  it 'BugzillaHelper#bug_status returns status' do
    status = bugzilla.bug_status(123_45)
    expect(status).to be_a(String)
  end

  it 'BugzillaHelper#get_bugs_by_filter returns array' do
    bugs = bugzilla.get_bugs_by_filter('status' => 'NEW')
    expect(bugs).to be_a(Array)
  end

  it 'BugzillaHelper#get_bug_history returns array' do
    history = bugzilla.get_bug_history(123_45)
    expect(history).to be_a(Array)
  end
end
