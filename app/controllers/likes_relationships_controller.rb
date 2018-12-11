class LikesRelationshipsController < ApplicationController
  def create
    begin
      micropost = Micropost.find(params[:like_id])
      current_user.like(micropost)
      flash[:success] = 'Likeしました。'
      redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to root_path, notice: notice
    end
  end

  def destroy
    begin
      micropost = Micropost.find(params[:like_id])
      current_user.unlike(micropost)
      flash[:success] = 'Likeを解除しました。'
      redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to root_path, notice: notice
    end
  end
end
