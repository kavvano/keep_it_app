class CommentsController < ApplicationController
  before_action :authenticate_user!

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
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to tweet_path(params[:tweet_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
