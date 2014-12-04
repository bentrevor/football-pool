require 'spec_helper'

describe User do
  let(:user) { User.create(name: 'asdf') }

  it 'has picks' do
    expect(user.picks).to be_empty
  end

  describe 'pick abbreviation' do
    let(:bears)   { Team.create(name: 'Bears')   }
    let(:packers) { Team.create(name: 'Packers') }
    let(:game1)   { Game.create(home_team_id: bears.id, away_team_id: packers.id, kickoff_time: Time.now) }
    let(:game2)   { Game.create(home_team_id: packers.id, away_team_id: bears.id, kickoff_time: Time.now + 5.days) }

    it 'has an abbreviation for a pick' do
      Pick.create(game_id: game1.id, is_home_team: true, user_id: user.id)

      expect(user.pick_abbreviation_for(game1.id)).to eq 'B'
      expect(user.pick_abbreviation_for(game2.id)).to eq ''
    end
  end
end
