class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User was added"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user.update_attribute(:avatar, params[:user][:avatar])
      flash[:notice] = "User updated."
      redirect_to users_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "The user was deleted."
      redirect_to users_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:avatar, :name, :password, :password_confirmation)
    end
end