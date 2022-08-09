class routinesController < ApplicationController
  before_action :set_routine, only: %i[show edit update destroy]

  def index
    @routines = current_user.routines
  end

  def show; end

  def new
    @new_routine = current_user.routines.build
  end

  def create
    @new_routine = current_user.routines.build(routine_params)
    if @new_routine.save
      redirect_to routines_url, notice: "Successfully created #{@new_routine.name}"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @routine.update(routine_params)
      redirect_to routines_url, notice: "Successfully updated #{@routine.name}"
    else
      render :edit
    end
  end

  def destroy
    @routine.destroy
    redirect_to routines_url, notice: "Successfully deleted #{@routine.name}"
  end

  private

  def set_routine
    @routine = current_user.routines.find(params[:id])
  end

  def routine_params
    params.require(:routine).permit(:name, :description)
  end
end
