class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new params[:user_session]
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to root_url
    else
      flash[:error] = "Login or password incorrect"
      render :action => :new
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to root_url
  end
end