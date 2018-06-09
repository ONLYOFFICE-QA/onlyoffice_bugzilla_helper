require 'spec_helper'

RSpec.describe OnlyofficeBugzillaHelper::BugzillaHelper do
  let(:bugzilla) { OnlyofficeBugzillaHelper::BugzillaHelper.new }

  it 'BugzillaHelper#bug_exists? correct for existing bug' do
    expect(bugzilla.bug_exists?(123_45)).to be_truthy
  end

  it 'BugzillaHelper#bug_exists? correct for nonexisting bug' do
    expect(bugzilla.bug_exists?(123_457_891_011)).to be_falsey
  end
end
