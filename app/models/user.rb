class User < ActiveRecord::Base
  has_many :picks
  has_many :games, through: :picks

  def self.by_standing_in_week(week_id)
    stats = Stat.where(week_id: week_id)
    user_ids = stats.sort_by(&:current_standing).map(&:user_id)

    user_ids.map {|id| find_by(id: id)}.compact
  end

  def pick_abbreviation_for(game_id)
    if games.map(&:id).include?(game_id)
      pick = picks.find_by(game_id: game_id)
      pick.abbreviation(game_id)
    else
      ''
    end
  end
end
