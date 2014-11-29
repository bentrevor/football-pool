require 'spec_helper'

describe Pick do
  it 'has a game and a team' do
    home_team = Team.create(name: 'asdf')
    away_team = Team.create(name: 'jkl;')
    game = Game.create(home_team_id: home_team.id, away_team_id: away_team.id)

    pick = Pick.create(team_id: home_team.id, game_id: game.id)

    expect(pick.team).to eq home_team
    expect(pick.game).to eq game
  end
end
