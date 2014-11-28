require 'spec_helper'

describe Week do
  it 'has games' do
    week = Week.new

    expect(week.games).to be_empty
  end
end
