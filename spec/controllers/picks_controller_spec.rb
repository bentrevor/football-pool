require 'spec_helper'

describe PicksController do
  it 'creates a pick and still shows the week table' do
    game = Game.create(home_team_id: Team.create(name: 'home_team_name').id, away_team_id: Team.create(name: 'away_team_name').id, kickoff_time: Time.now)
    post :create, { is_home_team: true, game_id: game.id, current_user_name: 'asdf' }

    expect(Pick.first.team.name).to eq 'home_team_name'
  end
end
