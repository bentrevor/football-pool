class WeeksController < ApplicationController
  def index
    @weeks = Week.all
  end

  def show
    week = Week.find(params[:id])
    @week = week
    @users = @week.users_by_ranking
  end
end
