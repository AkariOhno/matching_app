class AdoptController < ApplicationController
  before_action :authenticate_user

  def ensure
    @post = Post.find_by(id: params[:id])
  end

  def send_request
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    flash[:notice] = "里親申請しました"
    redirect_to("/posts/index")
  end

end
