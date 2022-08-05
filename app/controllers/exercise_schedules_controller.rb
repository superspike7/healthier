class ExerciseSchedulesController < ApplicationController
  def index
    @user = current_user
  end

  def show; end

  def new
    # setup permissions
  end

  def create
  end

  def destroy
  end
end
