require 'spec_helper'

describe Game do
  let(:home_team) { Team.create(name: 'Bears') }
  let(:away_team) { Team.create(name: 'Packers') }
  let(:game)      { Game.create(home_team_id: home_team.id, away_team_id: away_team.id, kickoff_time: Time.now) }

  it 'has home and away teams' do
    expect(game.home_team).to eq home_team
    expect(game.away_team).to eq away_team
  end

  describe '#finish' do
    it 'assigns scores and a winner' do
      expect(game.winner).to be nil

      game.finish(21, 14)

      expect(game.home_team_score).to eq 21
      expect(game.away_team_score).to eq 14
      expect(game.winner).to eq home_team
    end
  end
end
