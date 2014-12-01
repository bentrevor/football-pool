require 'spec_helper'

describe Game do
  it 'has home and away teams' do
    home_team = Team.create(name: 'asdf')
    away_team = Team.create(name: 'jkl;')

    game = Game.create(home_team_id: home_team.id, away_team_id: away_team.id, kickoff_time: Time.now)

    expect(game.home_team).to eq home_team
    expect(game.away_team).to eq away_team
  end
end
