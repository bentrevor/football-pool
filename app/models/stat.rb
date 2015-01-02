class Stat < ActiveRecord::Base
  belongs_to :user
  belongs_to :week

  def self.create_all_for_week(week)
    last_week = find_previous_week(week)
    if last_week
      last_week_game_ids = last_week.games.map(&:id)
      last_week_picks = Pick.where(game_id: last_week_game_ids)

      User.all.each do |user|
        stat = new(week_id: week.id, user_id: user.id)

        wins_last_week = last_week_picks.select { |pick| pick.user == user && pick.correct? }.length

        stat.games_won_last_week = wins_last_week
        stat.save!
      end

      set_standings(week)
    else
      User.all.each do |user|
        create(week_id: week.id, user_id: user.id, games_won_last_week: 0, current_standing: 1)
      end
    end
  end

  private

  def self.find_previous_week(week)
    # TODO this won't work for week 1
    Week.find_by(week_number: week.week_number - 1, year: week.year)
  end

  def self.set_standings(week)
    stats_by_games_won = where(week_id: week.id).order(:games_won_last_week)

    stats_by_games_won.each_with_index do |stat, index|
      stat.update_attributes(current_standing: index + 1)
      stat.save!
    end
  end
end
