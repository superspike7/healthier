require 'rails_helper'

RSpec.describe TimedExercise, type: :model do
  let!(:timed_exercise) { create(:timed_exercise) }
  let!(:other_timed_exercise) { create(:timed_exercise, name: 'Test2') }

  describe '.all_except' do
    it 'returns all timed exercises except the passed exercises' do
      expect(TimedExercise.all_except(other_timed_exercise)).not_to include(other_timed_exercise)
    end
  end
end
