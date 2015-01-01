class Week < ActiveRecord::Base
  has_many :games

  def games_by_kickoff_time
    games.order(:kickoff_time).all
  end

  def users_by_ranking
    User.by_ranking_in_week(id)
  end
end
