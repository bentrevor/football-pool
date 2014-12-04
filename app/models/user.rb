class User < ActiveRecord::Base
  has_many :picks
  has_many :games, through: :picks

  def pick_abbreviation_for(game_id)
    if games.map(&:id).include?(game_id)
      pick = picks.find_by(game_id: game_id)
      first_n_letters(game_id, pick).capitalize
    else
      ''
    end
  end

  private

  def first_n_letters(game_id, pick)
    if pick.team.name == '49ers'
      '49'
    else
      game = Game.find(game_id)
      last_letter = shared_letters(game.home_team.name, game.away_team.name)

      pick.team.name[0..last_letter]
    end
  end

  def shared_letters(home, away, count=0)
    if home[0].downcase == away[0].downcase
      shared_letters(home[1..-1], away[1..-1], count + 1)
    else
      count
    end
  end
end
