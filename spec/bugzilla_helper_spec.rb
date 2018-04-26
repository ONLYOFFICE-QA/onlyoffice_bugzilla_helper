require 'spec_helper'

RSpec.describe OnlyofficeBugzillaHelper::BugzillaHelper do
  let(:bugzilla) { OnlyofficeBugzillaHelper::BugzillaHelper.new }

  it 'check status of bug' do
    expect(bugzilla.bug_status(10)).to eq('CLOSED')
  end

  it 'bug_id_from_string correct url' do
    expect(bugzilla.bug_id_from_string("http://#{bugzilla.url}/show_bug.cgi?id=32296")).to eq(32_296)
  end

  it 'bug_id_from_string with string that looks like correct bugzilla bug url' do
    expect(bugzilla.bug_id_from_string("http://#{bugzilla.url}/test?id=32296")).to be_nil
  end

  it 'bug_id_from_string with string that looks like correct bugzilla bug param' do
    expect(bugzilla.bug_id_from_string("http://#{bugzilla.url}/show_bug.cgi?test=32296")).to be_nil
  end

  it 'bug_id_from_string without digits' do
    expect(bugzilla.bug_id_from_string('test')).to be_nil
  end

  it 'bug_id_from_string with digits but another url' do
    expect(bugzilla.bug_id_from_string('http://bugzserver/show_bug.cgi?id=31427')).to be_nil
  end
end
