class Game < ActiveRecord::Base
  has_many :picks
  has_many :users, through: :picks

  def self.between(away_team_name, home_team_name, kickoff_time = nil)
    kickoff_time ||= Time.zone.parse('12:00pm')

    create(home_team_id: Team.find_or_create_by(name: home_team_name).id,
           away_team_id: Team.find_or_create_by(name: away_team_name).id,
           kickoff_time: kickoff_time)
  end

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
