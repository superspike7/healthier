class TimedExercisesController < ApplicationController
  before_action :set_timed_exercise, only: %i[show edit update destroy]
  def index
    @timed_exercises = current_user.timed_exercises
    render partial: 'timed_exercises/table', locals: { timed_exercises: @timed_exercises }
  end

  def show; end

  def new
    @timed_exercise = current_user.timed_exercises.build(name: params[:name])
  end

  def create
    @timed_exercise = current_user.timed_exercises.build(timed_exercise_params)
    if @timed_exercise.save
      redirect_to root_path, notice: "Successfully created #{@timed_exercise.name}"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @timed_exercise.update(timed_exercise_params)
      redirect_to @timed_exercise, notice: "Successfully updated #{@timed_exercise.name}"
    else
      render :edit
    end
  end

  def destroy
    @timed_exercise.destroy
    redirect_to timed_exercises_path, notice: "Successfully deleted #{@timed_exercise.name}"
  end

  private

  def set_timed_exercise
    @timed_exercise = current_user.timed_exercises.find(params[:id])
  end

  def timed_exercise_params
    params.require(:timed_exercise).permit(:name, :description, :hour, :minutes)
  end
end
