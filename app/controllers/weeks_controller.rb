class WeeksController < ApplicationController
  def index
    @weeks = Week.all
  end

  def show
    week = Week.find(params[:id])
    session[:week_id] = week.id
    @week = week
  end
end
