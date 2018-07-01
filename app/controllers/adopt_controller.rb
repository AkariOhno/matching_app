class AdoptController < ApplicationController
  before_action :authenticate_user
  before_action :check_user_info, {only: [:ensure]}

  def ensure
    @post = Post.find_by(id: params[:id])
  end

  def send_request
    @request = Request.new(
      content: params[:content],
      sender_id: @current_user.id,
      receiver_id: params[:id]
    )
    if @request.save
      flash[:notice] = "里親申請しました"
      redirect_to("/posts/index")
    else
      render("/adopt/ensure")
    end
  end

  def check_user_info
    if @current_user.age == nil
      flash[:notice] = "ユーザー情報を登録して下さい"
      redirect_to("/users/#{@current_user.id}/edit")
      return
    end
    if @current_user.prefecture == nil
      flash[:notice] = "ユーザー情報を登録して下さい"
      redirect_to("/users/#{@current_user.id}/edit")
      return
    end
    if @current_user.city == nil
      flash[:notice] = "ユーザー情報を登録して下さい"
      redirect_to("/users/#{@current_user.id}/edit")
      return
    end
    if @current_user.job == nil
      flash[:notice] = "ユーザー情報を登録して下さい"
      redirect_to("/users/#{@current_user.id}/edit")
      return
    end
    if @current_user.family_adult == nil
      flash[:notice] = "ユーザー情報を登録して下さい"
      redirect_to("/users/#{@current_user.id}/edit")
      return
    end
    if @current_user.family_child == nil
      flash[:notice] = "ユーザー情報を登録して下さい"
      redirect_to("/users/#{@current_user.id}/edit")
      return
    end
  end

end
