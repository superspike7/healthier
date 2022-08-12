require 'rails_helper'

RSpec.describe "Add repetition exercise", type: :system do
    let!(:user) { create(:user) }

    it "creates a user repetition exercise" do
        exercise_name = "My exercise name"
        description = "Exercise description"
        repetition = 12
        set = 3

        sign_in user
        visit new_repetition_exercise_path

        fill_in "repetition_exercise_name", with: exercise_name
        fill_in "repetition_exercise_description", with: description
        fill_in "repetition_exercise_repetition", with: repetition
        fill_in "repetition_exercise_set", with: set

        click_on "commit"

        expect(page).to have_css("#flash")



    end
end