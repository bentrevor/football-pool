require 'spec_helper'

describe Team do
  let(:team) { Team.create(name: 'Bears') }

  describe '#record' do
    it 'shows the wins and losses' do
      team.wins = 1
      team.losses = 2

      expect(team.record).to eq '1 - 2'
    end

    it 'shows ties if there are any' do
      team.wins = 1
      team.losses = 2
      team.ties = 3

      expect(team.record).to eq '1 - 2 - 3'
    end
  end

  it 'finds by name with a pretty syntax' do
    expect(team).to eq Team['Bears']
  end
end
