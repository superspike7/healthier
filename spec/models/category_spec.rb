require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:category) { create(:category) }
  let(:repetition_exercise) { create(:repetition_exercise, user: category.user) }
  let(:timed_exercise) { create(:timed_exercise, user: category.user) }
  let(:repetition) { { repetition: [repetition_exercise.id], timed: [] } }
  let(:timed) { { repetition: [], timed: [timed_exercise.id] } }

  describe '#add_exercise_in_category' do
    it 'adds repetition exercise in the category' do
      expect { category.add_exercise_in_category(repetition) }.to change { category.repetition_exercises.count }.by(1)
    end

    it 'adds timed exercise in the category' do
      exercises = { repetition: [], timed: [timed_exercise.id] }
      expect { category.add_exercise_in_category(exercises) }.to change { category.timed_exercises.count }.by(1)
    end
  end

  describe '#remove_repetition_exercose' do
    let!(:category_with_rep_exercise) { category.add_exercise_in_category(repetition) }
    it 'removes repetition exercise in the category' do
      expect { category.remove_repetition_exercise(repetition_exercise) }
        .to change { category.repetition_exercises.count }.by(-1)
    end
  end

  describe '#remove_timed_exercise' do
    let!(:category_with_timed_exercise) { category.add_exercise_in_category(timed) }
    it 'removes timed exercise in the category' do
      expect { category.remove_timed_exercise(timed_exercise) }.to change { category.timed_exercises.count }.by(-1)
    end
  end
end
