class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :logout, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  def requesting
    @user = User.find_by(id: params[:id])
    @requests = Request.where(sender_id: @user.id)
  end

  def requested
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def request_show
    @request = Request.find_by(id: params[:id])
    @sender = User.find_by(id: @request.sender_id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
    )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/users/login")
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.age = params[:age]
    @user.prefecture = params[:prefecture]
    @user.city = params[:city]
    @user.job = params[:job]
    @user.family_adult = params[:family_adult]
    @user.family_child = params[:family_child]
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end




end
