class DailyIntakesController < ApplicationController
  def index
    # @nutrients_today
    @daily_intake_today = current_user.daily_intakes.last
    render partial: 'daily_intakes/daily_intakes', locals: { intakes: @intakes }
  end

  def show
    @daily_intake = current_user.daily_intakes.find(params[:id])
  end

  def create
    current_user.daily_intakes.create
    redirect_back_or_to root_url, notice: 'Successfully initialized a new daily intake information.'
  end
end
