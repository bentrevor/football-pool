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

  it 'shows all weeks' do
    3.times { |n| Week.create(year: 2014, week_number: n) }

    get :index

    expect(assigns(:weeks).length).to eq 3
  end
end
