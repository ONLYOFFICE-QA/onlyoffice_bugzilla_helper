require 'spec_helper'

RSpec.describe OnlyofficeBugzillaHelper::BugzillaHelper do
  let(:bugzilla) { OnlyofficeBugzillaHelper::BugzillaHelper.new }

  it 'BugzillaHelper#bug_exists? correct for existing bug' do
    expect(bugzilla.bug_exists?(123_45)).to be_truthy
  end

  it 'BugzillaHelper#bug_exists? correct for nonexisting bug' do
    expect(bugzilla.bug_exists?(123_457_891_011)).to be_falsey
  end

  it 'BugzillaHelper#bug_data has some data' do
    data = bugzilla.bug_data(123_45)
    expect(data['summary']).not_to be_empty
    expect(data['creator']).not_to be_empty
  end
end
