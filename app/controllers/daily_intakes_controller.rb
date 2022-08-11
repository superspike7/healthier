class DailyIntakesController < ApplicationController
  def index
    @daily_intake_today = current_user.daily_intakes.last
    @stats = Intake::NutrientsDescriptor.call(@daily_intake_today)
    render partial: 'daily_intakes/daily_intakes', locals: { intakes: @intakes }
  end

  def create
    current_user.daily_intakes.create
    redirect_back_or_to root_url, notice: 'Successfully initialized a new daily intake information.'
  end
end
