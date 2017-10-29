class UsersController < ApplicationController
  # before_action :require_logged_out

  #TODO @user instance variable here to pass info to html forms
  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    render :show
  end

  def index
    render :index
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
