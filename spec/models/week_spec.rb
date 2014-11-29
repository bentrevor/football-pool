require 'spec_helper'

describe Week do
  it 'has games' do
    week = Week.create(year: 2014, week_number: 1)

    expect(week.games).to be_empty
  end
end
