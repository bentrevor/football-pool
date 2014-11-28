class Game < ActiveRecord::Base
  def home_team
    Team.find(home_team_id)
  end

  def away_team
    Team.find(away_team_id)
  end
end
