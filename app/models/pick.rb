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

  def abbreviation(game_id)
    first_n_letters(game_id).capitalize
  end

  def home_team
    Team.find(game.home_team_id)
  end

  def away_team
    Team.find(game.away_team_id)
  end

  def correct?
    # TODO this doesn't handle tie games...
    home_score = game.home_team_score
    away_score = game.away_team_score

    if home_score && away_score
      if is_home_team
        home_score > away_score
      else
        away_score > home_score
      end
    end
  end

  private

  def first_n_letters(game_id)
    if team.name == '49ers'
      '49'
    else
      game = Game.find(game_id)
      last_letter = shared_letters(game.home_team.name, game.away_team.name)

      team.name[0..last_letter]
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
