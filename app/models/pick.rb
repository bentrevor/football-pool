class Pick < ActiveRecord::Base
  belongs_to :game
  belongs_to :user

  def team
    if is_home_team
      home_team
    else
      away_team
    end
  end

  def other_team
    if is_home_team
      away_team
    else
      home_team
    end
  end

  def to_s
    "#{user.name} picks #{team.name} over #{other_team.name}"
  end

  def home_team
    Team.find(game.home_team_id)
  end

  def away_team
    Team.find(game.away_team_id)
  end
end
