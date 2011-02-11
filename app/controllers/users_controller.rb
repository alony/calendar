class UsersController < ApplicationController
  before_filter :find_user, :only => [:edit, :update, :show, :destroy]
  before_filter :validate_current_user, :only => [:edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new params[:user]
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def update
    if @user.update_attributes params[:user]
      redirect_to @user
    else
      render :action => :edit
    end 
  end
  
  def destroy
    @user.destroy
    redirect_to root_path
  end
  
  private
  def validate_current_user
    @user == current_user
  end
  
  def find_user
    @user = User.find_by_id params[:id]
    redirect_to root_path if @user.blank?
  end
end
