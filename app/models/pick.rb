class Pick < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  def team
    if is_home_team
      Team.find(game.home_team_id)
    else
      Team.find(game.away_team_id)
    end
  end
end
