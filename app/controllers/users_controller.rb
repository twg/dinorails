class UsersController < ApplicationController

  before_filter :load_user, :only => [:show, :edit]
  
  def index
    @users = User.all
  end
  
  def show
    render
  end
  
  def new
    @user = User.new(params[:user])
  end
  
  def edit
    render
  end

  def create
    @user = User.new(params[:user])
    @user.save!
    flash[:notice] = 'User created'
    redirect_to :action => :show, :id => @user
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to create user'
    render :new
  end

protected
  
  def load_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :not_found, :status => :not_found
  end
  
end
