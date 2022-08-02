class CommentsController < ApplicationController
    def create
        @comment = current_user.comments.build(comment_params)

        if @comment.save
            redirect_back_or_to root_path
        else
            flash[:notice] = @comment.errors.full_messages.to_sentence
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_back_or_to root_path
    end

    private

    def comment_params
        params.permit(:body).merge(post_id: params[:post_id])
    end
end
