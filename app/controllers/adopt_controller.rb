class AdoptController < ApplicationController
  
  def request
    @post = Post.find_by(id: params[:id])
    if @current_user.age && @current_user.prefecture && @current_user.city && @current_user.job && @current_user.family_adult && @current_user.family_child
      redirect_to("/adopt/#{@post.id}/ensure")
    else
      flash[:notice] = "ユーザー情報を登録して下さい"
      redirect_to("/users/#{@current_user.id}/edit")
    end
  end

  def ensure
    @post = Post.find_by(id: params[:id])
  end

  def send
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    flash[:notice] = "里親申請しました"
    redirect_to("/posts/index")
  end

end
