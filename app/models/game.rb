class Game < ActiveRecord::Base
  has_many :picks
  has_many :users, through: :picks

  def home_team
    Team.find(home_team_id)
  end

  def away_team
    Team.find(away_team_id)
  end
end
