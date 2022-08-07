class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = current_user.categories
  end

  def show; end

  def new
    @new_category = current_user.categories.build
  end

  def create
    @new_category = current_user.categories.build(category_params)
    if @new_category.save
      redirect_to categories_url, notice: "Successfully created #{@new_category.name}"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_url, notice: "Successfully updated #{@category.name}"
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: "Successfully deleted #{@category.name}"
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
