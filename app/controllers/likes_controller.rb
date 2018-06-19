class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])
    @like.save
    flash[:notice] = "投稿をブックマークしました"
    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
    @like.destroy
    flash[:notice] = "ブックマークを解除しました"
    redirect_to("/posts/#{params[:post_id]}")
  end

end
