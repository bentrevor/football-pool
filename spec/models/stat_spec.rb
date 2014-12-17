require 'spec_helper'

describe Stat do
  it 'records stuff when a game is saved' do
    user = User.create(name: 'name')
    week = Week.create(year: 2014, week_number: 1)

    s = Stat.new(week_id: week.id, user_id: user.id)

    expect(s.user).to eq user
    expect(s.week).to eq week
  end
end
