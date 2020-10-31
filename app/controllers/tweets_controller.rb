class TweetsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, only: [:show, :destroy]

  def index
    @tweets = Tweet.includes(:user).order('created_at desc')
  end

  def new
    @tweet_tag = TweetTagForm.new
  end

  def create
    @tweet_tag = TweetTagForm.new(tweet_tag_params)
    if @tweet_tag.valid?
      @tweet_tag.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
    @keep_it_up = KeepItUp.find_by(user_id: current_user.id, tweet_id: params[:id])
  end

  def edit
    @tweet_tag = TweetTagForm.new
    @tweet = Tweet.find(params[:id])
    @tag = @tweet.tags[0]
  end

  def update
    @tweet_tag = TweetTagForm.new(tweet_tag_params)
    if @tweet_tag.valid?
      @tweet_tag.update
      redirect_to tweet_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  def search
    return nil if params[:keyword] == ''

    tag = Tag.where(['name like ?', "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  private

  def tweet_tag_params
    params.require(:tweet_tag_form).permit(:text, :name, :image).merge(user_id: current_user.id, id: params[:id])
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
