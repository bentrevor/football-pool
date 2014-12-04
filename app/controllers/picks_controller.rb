class PicksController < ApplicationController
  def create
    params.each do |k, v|
      next unless k =~ /game\d\d/

      game = Game.find(k[-2..-1].to_i)
      Pick.create(game_id: game.id,
                  is_home_team: true,
                  user_id: User.find_by(name: session[:current_user_name]).id)
    end

    render 'weeks/show'
  end
end
