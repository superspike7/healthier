class RoutinesController < ApplicationController
  before_action :authorize_user

  def index
    @routines = current_user.routines
    render partial: 'routine_exercises/exercises'
  end

  def new
    @new_routine = current_user.routines.build
  end

  def create
    @new_routine = current_user.routines.build(routine_only_params)
    if @new_routine.save
      @new_routine.add_exercise_in_routine(exercise_only_params)
      redirect_to dashboard_url, notice: "Successfully created #{@new_routine.name}"
    else
      render :new
    end
  end

  def destroy
    routine = current_user.routines.find(params[:id])
    routine.destroy
    redirect_to routines_url, notice: "Successfully deleted #{routine.name}"
  end

  private

  def routine_params
    params.require(:routine).permit(:name, timed: [], repetition: [])
  end

  def routine_only_params
    { name: routine_params[:name] }
  end

  def exercise_only_params
    { timed: routine_params[:timed], repetition: routine_params[:repetition] }.tap do |param|
      param.each_value { |value| value.reject!(&:blank?) }
    end
  end
end
