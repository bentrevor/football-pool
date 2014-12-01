require 'spec_helper'

describe GamesController do
  it 'shows a game' do
    game = Game.create(home_team_id: 1, away_team_id: 2, kickoff_time: Time.now)
    get :show, id: game.id

    expect(response.status).to be 200
    expect(assigns(:game)).to eq game
  end
end
