class PicksController < ApplicationController
  def create
    params.each do |k, v|
      next unless k =~ /game\d*/

      is_home_team = v[0..3] == 'home'
      game = Game.find(k[4..-1].to_i)
      Pick.create(game_id: game.id,
                  is_home_team: is_home_team,
                  user_id: User.find_by(name: session[:current_user_name]).id)
    end

    redirect_to :back
  end
end
