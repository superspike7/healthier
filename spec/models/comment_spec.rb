require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:comment) { create(:comment) }

  describe '.comment_asc' do
    let!(:comment_one) { create(:comment) }
    let!(:comment_two) { create(:yesterday_comment) }
    it 'orders ascendingly based on created_at attribute' do
      expect(Comment.comment_asc).to(eq([comment_two, comment_one]))
    end
  end

  describe '#add' do
    context 'when sender is not same with receiver' do
      it 'adds a comment with notification' do
        expect { comment.add(sender: user, receiver: comment.post.user) }.to change { Comment.count }.by(1)
                                                                         .and change { Notification.count }.by(1)
      end
    end

    context 'when sender is same with receiver' do
      it 'adds a comment without notification' do
        expect { comment.add(sender: user, receiver: user) }.to change { Comment.count }.by(1)
                                                                         .and change { Notification.count }.by(0)
      end
    end
  end

  describe '#destroy_including_notifications' do
    let!(:saved_comment) { comment.add(sender: user, receiver: comment.post.user) }
    it 'destroys the comment including its associated notification' do
      expect { Comment.first.destroy_including_notifications }.to change { Comment.count }.by(-1)
                                                              .and change { Notification.count }.by(-1)
    end
  end
end
