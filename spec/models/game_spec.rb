require 'spec_helper'

describe Game do
  let(:home_team) { Team.create(name: 'Bears') }
  let(:away_team) { Team.create(name: 'Packers') }
  let(:game)      { Game.create(home_team_id: home_team.id, away_team_id: away_team.id, kickoff_time: Time.now) }

  it 'has home and away teams' do
    expect(game.home_team).to eq home_team
    expect(game.away_team).to eq away_team
  end

  describe '#between' do
    it 'creates a game' do
      game = Game.between(away_team.name, home_team.name)

      expect(game.home_team_id).to eq home_team.id
      expect(game.away_team_id).to eq away_team.id
    end

    it 'defaults the kickoff time to noon' do
      noon_game = Game.between('Packers', 'Bears')
      night_game = Game.between('Packers', 'Bears', Time.zone.parse('7:30pm'))

      expect(noon_game.kickoff_time.hour).to eq 12
      expect(night_game.kickoff_time.hour).to eq 19
    end
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
