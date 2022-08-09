require 'rails_helper'

RSpec.describe Meal, type: :model do
  let(:food) { create(:food) }
  let(:meal) { create(:meal) }
  
  describe '#add_food' do
    it 'adds food in the meal with a passed food id' do
      expect { meal.add_food(food) }.to change { meal.foods.count }.by(1)
    end
  end

  describe '#remove_food' do
    it 'deletes food in the meal' do
      meal.add_food(food)
      expect { meal.remove_food(food) }.to change { meal.foods.count }.by(-1)
    end
  end

  describe '#total_calories' do
    it 'returns the total calories of the meal' do
      meal.add_food(food)
      expect(meal.total_calories).to eq(food.calories)
    end
  end

  describe '#total_carbohydrates' do
    it 'returns the total carbohydrates of the meal' do
      meal.add_food(food)
      expect(meal.total_carbohydrates).to eq(food.carbohydrates)
    end
  end

  describe '#total_fats' do
    it 'returns the total fats of the meal' do
      meal.add_food(food)
      expect(meal.total_fats).to eq(food.fats)
    end
  end

  describe '#total_protein' do
    it 'returns the total protein of the meal' do
      meal.add_food(food)
      expect(meal.total_protein).to eq(food.protein)
    end
  end
end
