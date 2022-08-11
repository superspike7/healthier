require 'rails_helper'

RSpec.describe DailyIntake, type: :model do
  let(:daily_intake) { create(:daily_intake) }
  let(:food) { create(:food, user: daily_intake.user) }
  let(:meal) { create(:meal, user: daily_intake.user) }

  describe '#add_food' do
    it 'adds food in the daily intake' do
      expect { daily_intake.add_food(food) }.to change { daily_intake.foods.count }.by(1)
    end
  end

  describe '#add_food_from_meal' do
    it 'adds meal in the daily intake' do
      meal.add_food({ food_ids: food.id })
      expect { daily_intake.add_food_from_meal(meal) }.to change { daily_intake.foods.count }.by(meal.foods.count)
    end
  end

    describe '#total_calories' do
    it 'returns the total calories of the daily intake' do
      daily_intake.add_food(food)
      expect(daily_intake.total_calories).to eq(food.calories)
    end
  end

  describe '#total_carbohydrates' do
    it 'returns the total carbohydrates of the daily intake' do
      daily_intake.add_food(food)
      expect(daily_intake.total_carbohydrates).to eq(food.carbohydrates)
    end
  end

  describe '#total_fats' do
    it 'returns the total fats of the daily intake' do
      daily_intake.add_food(food)
      expect(daily_intake.total_fats).to eq(food.fats)
    end
  end

  describe '#total_protein' do
    it 'returns the total protein of the daily intake' do
      daily_intake.add_food(food)
      expect(daily_intake.total_protein).to eq(food.protein)
    end
  end
end
