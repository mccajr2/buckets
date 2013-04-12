class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @buckets = @user.buckets  #.paginate(page: params[:page])
    #@checkpoints = @bucket.checkpoints
  end
  
end
