require 'spec_helper'

RSpec.describe OnlyofficeBugzillaHelper::BugzillaHelper, '#comments' do
  let(:bugzilla) { described_class.new }

  it 'Check that comment include first comment (bug description)' do
    comments = bugzilla.comments(BUG_ID_TEST_STATUS)
    expect(comments.first['text']).to include('Сценарий')
  end
end
