require 'spec_helper'

describe Stat do
  let(:user) { User.create(name: 'name') }
  let(:week) { Week.create(year: 2014, week_number: 1) }
  # using a var called stat is confusing pry...
  let(:s)    { Stat.new(week_id: week.id, user_id: user.id) }

  it 'belongs to a week and user' do
    expect(s.user).to eq user
    expect(s.week).to eq week
  end
end
