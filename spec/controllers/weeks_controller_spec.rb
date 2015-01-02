require 'spec_helper'

describe WeeksController do
  let(:game) { Game.create(home_team_id: 1, away_team_id: 2, kickoff_time: Time.now) }
  let(:week) { Week.create(year: 2014, week_number: 1) }

  it 'shows a week' do
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

  it 'lists user by standing' do
    user = User.create(name: 'asdf')
    stat = Stat.create(week_id: week.id, user_id: user.id)
    week.games << game

    get :show, id: week.id

    expect(response.status).to be 200
    expect(assigns(:week)).to eq week
    expect(assigns(:users)).to eq [user]
  end
end
