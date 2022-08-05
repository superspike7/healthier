class RepExercisesController < ApplicationController
  before_action :set_rep_exercise
  def index
    @rep_exercises = current_user.rep_exercises
  end

  def show
  end

  def new
    @rep_exercise = current_user.rep_exercises.build
  end

  def create
    @rep_exercise = current_user.rep_exercises.build(rep_exercise_params)
    unless @rep_exercise.save
      flash[:notice] = @rep_exercise.errors.full_messages.to_sentence
    end

    redirect_back_or_to rep_exercises_path
  end

  def edit
  end

  def update
    if @rep_exercise.update(rep_exercise_params)
      redirect_to @rep_exercise
    else
      render :edit
    end

  end

  def destroy
    @rep_exercise.destroy
    redirect_back_or_to rep_exercises_path
  end

  private

  def set_rep_exercise
    @rep_exercise = current_user.rep_exercises.find_by(id: params[:id])
  end

  def rep_exercise_params
    params.require(:rep_exercise).permit(:name, :description, :repetition, :set)
  end
end
