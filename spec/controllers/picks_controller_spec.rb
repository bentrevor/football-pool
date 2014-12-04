require 'spec_helper'

describe PicksController do
  let(:name)    { 'asdf' }
  let(:user)    { User.create(name: name)      }
  let(:bears)   { Team.create(name: 'Bears')   }
  let(:packers) { Team.create(name: 'Packers') }
  let(:game1)   { Game.create(home_team_id: bears.id, away_team_id: packers.id, kickoff_time: Time.now) }
  let(:game2)   { Game.create(home_team_id: packers.id, away_team_id: bears.id, kickoff_time: Time.now + 5.days) }

  it 'creates a pick' do
    allow(Week).to receive(:find)
    opts = { "game#{game1.id}" => "home#{game1.id}", 'current_user_name' => name }.symbolize_keys
    session[:current_user_name] = user.name
    post :create, opts

    expect(Pick.first.team.name).to eq bears.name
  end
end
