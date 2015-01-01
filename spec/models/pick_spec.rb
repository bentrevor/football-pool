require 'spec_helper'

describe Pick do
  let(:name)    { 'asdf' }
  let(:user)    { User.create(name: name)      }
  let(:bears)   { Team.create(name: 'Bears')   }
  let(:packers) { Team.create(name: 'Packers') }
  let(:game1)   { Game.create(home_team_id: bears.id, away_team_id: packers.id, kickoff_time: Time.now) }
  let(:game2)   { Game.create(home_team_id: packers.id, away_team_id: bears.id, kickoff_time: Time.now + 5.days) }

  it 'has a game and a team' do
    pick = Pick.create(is_home_team: true, game_id: game1.id)

    expect(pick.team).to eq bears
    expect(pick.game).to eq game1
  end

  it 'implements to_s' do
    pick = Pick.create(is_home_team: false, game_id: game2.id, user_id: user.id)
    expect(pick.to_s).to include name
    expect(pick.to_s).to include 'Bears over Packers'
  end

  describe '#correct?' do
    it "is nil when a game isn't finished yet" do
      pick = Pick.create(is_home_team: false, game_id: game2.id, user_id: user.id)

      expect(pick.correct?).to be nil
    end

    it 'knows when it is right' do
      pick = Pick.create(is_home_team: true, game_id: game2.id, user_id: user.id)
      game2.finish(21, 0)

      expect(pick.correct?).to be true
    end

    it 'knows when it is wrong' do
      pick = Pick.create(is_home_team: true, game_id: game2.id, user_id: user.id)
      game2.finish(0, 21)

      expect(pick.correct?).to be false
    end
  end
end
