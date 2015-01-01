class Stat < ActiveRecord::Base
  belongs_to :user
  belongs_to :week

  def self.create_all_for_week(week)
    last_week = find_previous_week(week)
    last_week_game_ids = last_week.games.map(&:id)
    last_week_picks = Pick.where(game_id: last_week_game_ids)

    User.all.each do |user|
      stat = new(week_id: week.id, user_id: user.id)

      wins_last_week = last_week_picks.select { |pick| pick.user == user && pick.correct? }.length

      stat.games_won_last_week = wins_last_week
      stat.save!
    end

    set_rankings
  end

  private

  def self.find_previous_week(week)
    # TODO this won't work for week 1
    Week.find_by(week_number: week.week_number - 1, year: week.year)
  end

  def self.set_rankings
  end
end
