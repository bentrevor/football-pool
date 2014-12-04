class User < ActiveRecord::Base
  has_many :picks
  has_many :games, through: :picks

  def pick_abbreviation_for(game_id)
    if games.map(&:id).include?(game_id)
      p = picks.find_by(game_id: game_id)
      p.team.name[0].capitalize
    else
      ''
    end
  end
end
