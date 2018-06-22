class PostsController < ApplicationController
before_action :authenticate_user
before_action :ensure_correct_post, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all
  end

  def dogs
    @posts = Post.where(animal: "犬")
  end

  def cats
    @posts = Post.where(animal: "猫")
  end

  def male
    @posts = Post.where(gender: "オス")
  end

  def female
    @posts = Post.where(gender: "メス")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      image_name: "no_image.jpg",
      animal: params[:animal],
      name: params[:name],
      gender: params[:gender],
      age: params[:age],
      breed: params[:breed],
      content: params[:content],
      user_id: @current_user.id
    )
    if @post.save
      flash[:notice] = "投稿を作成しました"
      if params[:image]
        @post.image_name = "#{@post.id}.jpg"
        @post.save
        image = params[:image]
        File.binwrite("public/post_images/#{@post.image_name}", image.read)
      end
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @likes_count = Like.where(post_id: @post.id).count
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if params[:image]
      @post.image_name = "#{@post.id}.jpg"
      @post.save
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_name}", image.read)
    end
    @post.animal = params[:animal]
    @post.name = params[:name]
    @post.gender = params[:gender]
    @post.age = params[:age]
    @post.breed = params[:breed]
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
end
