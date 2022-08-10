class RepetitionExercisesController < ApplicationController
  before_action :set_repetition_exercise, only: %i[show edit update destroy]
  def index
    @rep_exercises = current_user.repetition_exercises
    render partial: 'repetition_exercises/table', locals: { rep_exercises: @rep_exercises }
  end

  def show; end

  def new
    @rep_exercise = current_user.repetition_exercises.build
  end

  def create
    @rep_exercise = current_user.repetition_exercises.build(repetition_exercise_params)
    if @rep_exercise.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @rep_exercise.update(repetition_exercise_params)
      redirect_to @rep_exercise, notice: "Successfully updated #{@rep_exercise.name}."
    else
      render :edit
    end
  end

  def destroy
    @rep_exercise.destroy
    redirect_to repetition_exercises_path, notice: "Successfully deleted #{@rep_exercise.name}"
  end

  private

  def set_repetition_exercise
    @rep_exercise = current_user.repetition_exercises.find(params[:id])
  end

  def repetition_exercise_params
    params.require(:repetition_exercise).permit(:name, :description, :repetition, :set)
  end
end
