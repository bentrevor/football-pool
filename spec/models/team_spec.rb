require 'spec_helper'

describe Team do
  describe '#record' do
    it 'shows the wins and losses' do
      team = Team.new(wins: 1, losses: 2)

      expect(team.record).to eq '1 - 2'
    end

    it 'shows ties if there are any' do
      team = Team.new(wins: 1, losses: 2, ties: 3)

      expect(team.record).to eq '1 - 2 - 3'
    end
  end
end
