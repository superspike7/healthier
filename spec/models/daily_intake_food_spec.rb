require 'rails_helper'

RSpec.describe DailyIntakeFood, type: :model do
  let!(:daily_intake_food) { create(:daily_intake_food) }
  let!(:food) { daily_intake_food.food }

  describe '::remove_food' do
    it 'removes associated food in the collection' do
      expect { DailyIntakeFood.remove_food(food) }.to change { DailyIntakeFood.count }.by(-1)
    end
  end
end
