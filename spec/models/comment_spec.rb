require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) { create(:post) }

  describe '.comment_asc' do
    let!(:comment_one) { create(:comment) }
    let!(:comment_two) { create(:yesterday_comment) }
    it 'orders ascendingly based on created_at attribute' do
      expect(Comment.comment_asc).to(eq([comment_two, comment_one]))
    end
  end
end
