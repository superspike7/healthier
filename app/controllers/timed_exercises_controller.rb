class TimedExercisesController < ApplicationController
  before_action :authorize_user
  before_action :set_timed_exercise, only: %i[edit update destroy]

  def index
    @timed_exercises = current_user.timed_exercises
    render partial: 'timed_exercises/table'
  end

  def new
    @timed_exercise = current_user.timed_exercises.build(name: params[:name])
  end

  def create
    @timed_exercise = current_user.timed_exercises.build(timed_exercise_params)

    respond_to do |format|
      if @timed_exercise.save
        format.turbo_stream { flash.now[:notice] = "Successfully created #{@timed_exercise.name}" }
        format.html { redirect_to root_path, notice: "Successfully created #{@timed_exercise.name}" } 
      else
        render :new
      end
    end
  end

  def edit; end

  def update
    if @timed_exercise.update(timed_exercise_params)
      redirect_to root_path, notice: "Successfully updated #{@timed_exercise.name}"
    else
      render :edit
    end
  end

  def destroy
    @timed_exercise.destroy
    redirect_to timed_exercises_path
  end

  private

  def set_timed_exercise
    @timed_exercise = current_user.timed_exercises.find(params[:id])
  end

  def timed_exercise_params
    params.require(:timed_exercise).permit(:name, :description, :hour, :minutes)
  end
end
