require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }
  let(:yesterday_post) { create(:yesterday_post) }

  describe '.show_latest' do
    it 'returns posts with an order from latest to oldest' do
      expect(Post.show_latest).to eq([post, yesterday_post])
    end
  end
end
