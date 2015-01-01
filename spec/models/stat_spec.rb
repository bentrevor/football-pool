require 'spec_helper'

describe Stat do
  let!(:user)       { User.create(name: 'name') }
  let!(:week1)      { Week.create(year: 2014, week_number: 1) }
  let!(:game)       { Game.between('Bears', 'Packers') }
  let!(:week2)      { Week.create(year: 2014, week_number: 2) }
  let(:stat)        { Stat.find_by(week_id: week2.id, user_id: user.id) }
  let(:s)        { Stat.find_by(week_id: week2.id, user_id: user.id) }

  it 'belongs to a week and user' do
    Stat.create_all_for_week(week2)

    expect(stat.user).to eq user
    expect(stat.week).to eq week2
  end

  it 'counts the games won in a week' do
    game.week_id = week1.id
    Pick.create(user_id: user.id, game_id: game.id, is_home_team: false)
    game.finish(0, 50)

    Stat.create_all_for_week(week2)

    expect(stat.games_won_last_week).to eq 1
  end
end
