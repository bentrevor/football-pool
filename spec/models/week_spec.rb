require 'spec_helper'

describe Week do
  let(:week) { Week.create(year: 2014, week_number: 1) }

  it 'has games' do
    expect(week.games).to be_empty
  end

  it 'orders the game by their time' do
    first_game = Game.create(home_team_id: Team.create(name: 'Lions').id,      away_team_id: Team.create(name: 'Bears').id,     kickoff_time: Time.new(2014,11,27,11,30,0,"+06:00"))
    last_game  = Game.create(home_team_id: Team.create(name: 'Jets').id,       away_team_id: Team.create(name: 'Dolphins').id,  kickoff_time: Time.new(2014,12,1,19,30,0,"+06:00"))

    week.games << Game.create(home_team_id: Team.create(name: '49ers').id,      away_team_id: Team.create(name: 'Seahawks').id,  kickoff_time: Time.new(2014,11,27,19,30,0,"+06:00"))
    week.games << last_game
    week.games << Game.create(home_team_id: Team.create(name: 'Cowboys').id,    away_team_id: Team.create(name: 'Eagles').id,    kickoff_time: Time.new(2014,11,27,15,30,0,"+06:00"))
    week.games << Game.create(home_team_id: Team.create(name: 'Chiefs').id,     away_team_id: Team.create(name: 'Broncos').id,   kickoff_time: Time.new(2014,11,27,19,30,0,"+06:00"))
    week.games << first_game

    expect(week.games_by_kickoff_time.first).to eq first_game
    expect(week.games_by_kickoff_time.last).to eq last_game
  end

  it 'orders users by their rank' do
    first_place = User.create(name: 'first')
    second_place = User.create(name: 'second')
    third_place = User.create(name: 'third')

    week = Week.create(year: 2014, week_number: 1)

    Stat.create(week_id: week.id, user_id: first_place.id, current_standing: 1)
    Stat.create(week_id: week.id, user_id: second_place.id, current_standing: 2)
    Stat.create(week_id: week.id, user_id: third_place.id, current_standing: 3)

    expect(week.users_by_ranking).to eq [first_place, second_place, third_place]
  end
end
