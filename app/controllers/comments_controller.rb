class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)

        if @comment.save
            redirect_back_or_to root_path
        else
            redirect_back_or_to root_path
        end
    end

    def destroy
    end

    private


    def comment_params
        params.require(:comment).permit(:body,:user_id,:post_id)
    end
end
