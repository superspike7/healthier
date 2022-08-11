class RepetitionExercisesController < ApplicationController
  before_action :authorize_user
  before_action :set_repetition_exercise, only: %i[edit update destroy]
  
  def index
    @rep_exercises = current_user.repetition_exercises
    render partial: 'repetition_exercises/table'
  end

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
      redirect_to root_path, notice: "Successfully updated #{@rep_exercise.name}."
    else
      render :edit
    end
  end

  def destroy
    @rep_exercise.destroy
    redirect_to repetition_exercises_path
  end

  private

  def set_repetition_exercise
    @rep_exercise = current_user.repetition_exercises.find(params[:id])
  end

  def repetition_exercise_params
    params.require(:repetition_exercise).permit(:name, :description, :repetition, :set)
  end
end
