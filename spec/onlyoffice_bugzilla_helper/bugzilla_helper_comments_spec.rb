require 'spec_helper'

RSpec.describe OnlyofficeBugzillaHelper::BugzillaHelper, '#comments' do
  let(:bugzilla) { described_class.new }

  it 'Check that comment include first comment (bug description)' do
    comments = bugzilla.comments(BUG_ID_TEST_STATUS)
    expect(comments.first['text']).to include('Сценарий')
  end

  it 'Add comment to bug' do
    comment = Faker::StarWars.quote
    bugzilla.add_comment(BUG_ID_TEST_STATUS, comment)
    comments = bugzilla.comments(BUG_ID_TEST_STATUS)
    expect(comments.last['text']).to eq(comment)
  end
end
