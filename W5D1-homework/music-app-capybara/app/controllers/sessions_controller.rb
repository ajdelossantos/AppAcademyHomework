class SessionsController < ApplicationController
  # before_action :require_logged_in, only: [:destroy]
  # before_action :require_logged_out, only: [:new, :create]

  #TODO local variable, not instance variable
  def create
    #IDEA returns nil if user not found
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      flash[:errors] = ["Invalid arguments"]
      render :new
    else
      login!(user)
      redirect_to users_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
