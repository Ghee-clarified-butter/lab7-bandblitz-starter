class UsersController < ApplicationController
  before_action :check_login, only: [:edit, :update]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # GET /users/edit
  def edit
    @user = current_user
  end

  # PATCH/PUT /users
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to home_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Allow attributes except :password_digest; use :password and :password_confirmation instead
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role, :band_id, :active, :password, :password_confirmation)
  end
end
