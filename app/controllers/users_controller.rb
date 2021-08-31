class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def index
    @users = User.all
  end

  def new 
    @user = User.new
  end

  def create 
    @user = User.new(
      name: params[:name], 
      email: params[:email],
      password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/users/index")
    else
      render("users/new")
    end
  end

  def show 
    @user = User.find_by(id: params[:id])
  end

  def edit 
    @user = User.find_by(id: params[:id])
  end

  def update 
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login_form 

  end

  def login 
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/")      
    else
      render("users/login_form")
    end
  end

  def logout 
    session[:user_id] = nil 
    redirect_to("/login")
  end

  def likes 
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to("/posts/index")
    end
  end

end
