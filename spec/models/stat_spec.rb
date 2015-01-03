require 'spec_helper'

describe Stat do
  let!(:user)       { User.create(name: 'name') }
  let!(:user2)      { User.create(name: 'name2') }
  let!(:week1)      { Week.create(year: 2014, week_number: 1) }
  let!(:game)       { Game.between('Bears', 'Packers') }
  let!(:week2)      { Week.create(year: 2014, week_number: 2) }
  let(:week2_stat)  { Stat.find_by(week_id: week2.id, user_id: user.id) }

  it 'belongs to a week and user' do
    Stat.create_all_for_week(week2)

    expect(week2_stat.user).to eq user
    expect(week2_stat.week).to eq week2
  end

  it 'counts the games won in a week' do
    game.week_id = week1.id
    Pick.create(user_id: user.id, game_id: game.id, is_home_team: false)
    game.finish(0, 50)

    Stat.create_all_for_week(week2)

    expect(week2_stat.games_won_last_week).to eq 1
    expect(week2_stat.current_standing).to eq 1
    user2_stat = Stat.find_by(week_id: week2.id, user_id: user2.id)
    expect(user2_stat.current_standing).to eq 2
  end

  it 'creates zeroed stats for week 1 of a season' do
    Stat.create_all_for_week(week1)
    week1_stat = Stat.find_by(week_id: week1.id, user_id: user.id)

    expect(Stat.count).to be > 0

    expect(week1_stat.games_won_last_week).to eq 0
    expect(week1_stat.current_standing).to eq 1
  end
end
