class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit,:update, :destroy]}
  
  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.find_by(id: params[:id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      title: params[:title],
      user_id: @current_user.id,
      youtube_url: params[:youtube_url])
      url = @post.youtube_url.last(11)
      @post.youtube_url = url
      @post.save
    redirect_to("/")
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.youtube_url = params[:youtube_url]
    url = @post.youtube_url.last(11)
    @post.youtube_url = url
    @post.content = params[:content]
    @post.save
    redirect_to("/")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/")
  end
end
