class Week < ActiveRecord::Base
  has_many :games

  def games_by_kickoff_time
    games.order(:kickoff_time).all
  end

  def users_by_standing
    User.by_standing_in_week(id)
  end
end
