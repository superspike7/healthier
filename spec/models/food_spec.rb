require 'rails_helper'

RSpec.describe Food, type: :model do
  let!(:food) { create(:food) }
  let!(:other_food) { create(:food, name: 'Testfood') }

  describe '.all_except' do
    it 'returns all foods except the passed foods' do
      expect(Food.all_except(other_food)).not_to include(other_food)
    end
  end
end
