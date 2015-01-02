require 'spec_helper'

describe User do
  let(:user) { User.create(name: 'asdf') }

  it 'has picks' do
    expect(user.picks).to be_empty
  end

  it 'can be listed by standing' do
    first_place = User.create(name: 'first')
    second_place = User.create(name: 'second')
    third_place = User.create(name: 'third')

    week = Week.create(year: 2014, week_number: 1)

    Stat.create(week_id: week.id, user_id: first_place.id, current_standing: 1)
    Stat.create(week_id: week.id, user_id: second_place.id, current_standing: 2)
    Stat.create(week_id: week.id, user_id: third_place.id, current_standing: 3)

    expect(User.by_standing_in_week(week.id)).to eq [first_place, second_place, third_place]
  end

  describe 'pick abbreviation' do
    let(:bears)   { Team.create(name: 'Bears')   }
    let(:packers) { Team.create(name: 'Packers') }
    let(:broncos) { Team.create(name: 'Broncos') }
    let(:browns)  { Team.create(name: 'Browns')  }
    let(:game1)   { Game.create(home_team_id: bears.id, away_team_id: packers.id, kickoff_time: Time.now) }
    let(:game2)   { Game.create(home_team_id: packers.id, away_team_id: bears.id, kickoff_time: Time.now + 5.days) }

    it 'has an abbreviation for a pick' do
      Pick.create(game_id: game1.id, is_home_team: true, user_id: user.id)

      expect(user.pick_abbreviation_for(game1.id)).to eq 'B'
      expect(user.pick_abbreviation_for(game2.id)).to eq ''
    end

    it 'uses the first few letters when teams start with the same letter' do
      bears_at_broncos = Game.create(home_team_id: broncos.id, away_team_id: bears.id, kickoff_time: Time.now)
      browns_at_broncos = Game.create(home_team_id: broncos.id, away_team_id: browns.id, kickoff_time: Time.now)

      Pick.create(game_id: bears_at_broncos.id,  is_home_team: false, user_id: user.id)
      Pick.create(game_id: browns_at_broncos.id, is_home_team: false, user_id: user.id)

      expect(user.pick_abbreviation_for(bears_at_broncos.id)).to eq 'Be'
      expect(user.pick_abbreviation_for(browns_at_broncos.id)).to eq 'Brow'
    end

    it 'uses 49 for the 49ers' do
      sf = Team.create(name: '49ers')
      sf_at_bears = Game.create(home_team_id: bears.id, away_team_id: sf.id, kickoff_time: Time.now)

      Pick.create(game_id: sf_at_bears.id, is_home_team: false, user_id: user.id)

      expect(user.pick_abbreviation_for(sf_at_bears.id)).to eq '49'
    end
  end
end
