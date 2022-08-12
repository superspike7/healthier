require 'rails_helper'

RSpec.describe "Add timed exercise", type: :system do
    let!(:user) { create(:user) }

    it "creates a user timed exercise" do
        exercise_name = "My exercise name"
        description = "Exercise description"
        hour = 3
        minutes = 59

        sign_in user
        visit new_timed_exercise_path

        fill_in "timed_exercise_name", with: exercise_name
        fill_in "timed_exercise_description", with: description
        fill_in "timed_exercise_hour", with: hour
        fill_in "timed_exercise_minutes", with: minutes

        click_on "commit"

        expect(page).to have_css("#flash")



    end
end