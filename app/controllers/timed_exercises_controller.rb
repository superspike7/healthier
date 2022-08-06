class TimedExercisesController < ApplicationController
  before_action :set_timed_exercise
  def index
    @timed_exercises = current_user.timed_exercises
  end

  def show
  end

  def new
    @timed_exercise = current_user.timed_exercises.build
  end

  def create
    @timed_exercise = current_user.timed_exercises.build(timed_exercise_params)
    unless @timed_exercise.save
      flash[:notice] = @timed_exercise.errors.full_messages.to_sentence
    end

    redirect_back_or_to timed_exercises_path
  end

  def edit
  end

  def update
    if @timed_exercise.update(timed_exercise_params)
      redirect_to @timed_exercise
    else
      render :edit
    end

  end

  private

  def set_timed_exercise
    @timed_exercise = current_user.timed_exercises.find_by(id: params[:id])
  end

  def timed_exercise_params
    params.require(:timed_exercise).permit(:name, :description, :hour, :minutes)
  end
end
