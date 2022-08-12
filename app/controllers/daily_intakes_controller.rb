class DailyIntakesController < ApplicationController
  before_action :authorize_user

  def index
    @daily_intake_today = current_user.daily_intakes.last
    @nutrients_description = Intake::NutrientsDescriptor.call(@daily_intake_today)
    render partial: 'daily_intakes/daily_intakes'
  end

  def create
    current_user.daily_intakes.create
    redirect_to dashboard_url
  end
end
