require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) { create(:post) }

  describe '.comment_asc' do
    it 'returns comments in descending order'
  end
end
