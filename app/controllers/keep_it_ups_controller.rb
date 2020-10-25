class KeepItUpsController < ApplicationController
  def create
    unless KeepItUp.exists?(user_id: current_user.id, tweet_id: params[:tweet_id])
      KeepItUp.create(keep_it_up_params)
    end
    redirect_to tweet_path(params[:tweet_id])
  end

  def destroy
    keep_it_up = KeepItUp.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    if keep_it_up.present?
      keep_it_up.destroy
    end
    redirect_to tweet_path(params[:tweet_id])
  end

  private

  def keep_it_up_params
    params.permit(:tweet_id).merge(user_id: current_user.id)
  end
end
