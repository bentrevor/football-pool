class PicksController < ApplicationController
  def create
    params.each do |k, v|
      next unless k =~ /game\d\d/

      game = Game.find(k[4..-1].to_i)
      Pick.create(game_id: game.id,
                  is_home_team: true,
                  user_id: User.find_by(name: session[:current_user_name]).id)
    end

    @week = Week.find(session[:week_id])
    render 'weeks/show'
  end
end
