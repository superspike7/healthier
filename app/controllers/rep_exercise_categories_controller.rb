class RepExerciseCategoriesController < ApplicationController
    before_action :find_categ
    def new
        @new_rep_categ = @category.rep_exercises.build
        @exercises = current_user.rep_exercises.all_except(@category.rep_exercises)
    end

    def create
        
    end

    private

    def find_categ
        @category = current_user.exercise_categories.find(params[:exercise_category_id])
    end
end
