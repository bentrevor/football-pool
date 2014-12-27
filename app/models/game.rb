class Game < ActiveRecord::Base
  has_many :picks
  has_many :users, through: :picks

  def home_team
    Team.find(home_team_id)
  end

  def away_team
    Team.find(away_team_id)
  end

  def finish(home_score, away_score)
    update_attributes(home_team_score: home_score, away_team_score: away_score)
  end

  def winner
    if finished?
      if home_team_score > away_team_score
        home_team
      else
        away_team
      end
    end
  end

  private

  def finished?
    home_team_score
  end
end
