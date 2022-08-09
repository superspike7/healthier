require 'rails_helper'

RSpec.describe RepetitionExercise, type: :model do
  let!(:rep_exercise) { create(:repetition_exercise) }
  let!(:other_rep_exercise) { create(:repetition_exercise, name: 'Test') }

  describe '.all_except' do
    it 'returns all repetition exercises except the passed exercises' do
      expect(TimedExercise.all_except(other_rep_exercise)).not_to include(other_rep_exercise)
    end
  end
end
