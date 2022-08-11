require 'rails_helper'

RSpec.describe Routine, type: :model do
  let!(:routine) { create(:routine) }
  let(:repetition_exercise) { create(:repetition_exercise, user: routine.user) }
  let(:timed_exercise) { create(:timed_exercise, user: routine.user) }
  let(:repetition) { { repetition: [repetition_exercise.id], timed: [] } }
  let(:timed) { { repetition: [], timed: [timed_exercise.id] } }

  describe '#add_exercise_in_routine' do
    it 'adds repetition exercise in the routine' do
      expect { routine.add_exercise_in_routine(repetition) }.to change { routine.repetition_exercises.count }.by(1)
    end

    it 'adds timed exercise in the routine' do
      exercises = { repetition: [], timed: [timed_exercise.id] }
      expect { routine.add_exercise_in_routine(exercises) }.to change { routine.timed_exercises.count }.by(1)
    end
  end
end
