require 'spec_helper'

describe WeeksController do
  it 'shows a week' do
    game = Game.create(home_team_id: 1, away_team_id: 2)
    week = Week.create(year: 2014, week_number: 1)
    week.games << game

    get :show, id: week.id

    expect(response.status).to be 200
    expect(assigns(:week)).to eq week
  end
end
