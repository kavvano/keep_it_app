class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.invalid?
      flash[:alert] = comment.errors.full_messages
    else
      comment.save
    end
    redirect_to tweet_path(comment[:tweet_id])
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
