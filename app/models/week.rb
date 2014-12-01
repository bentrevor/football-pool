class Week < ActiveRecord::Base
  has_many :games

  def games_in_order
    games.order(:kickoff_time).all
  end
 end
