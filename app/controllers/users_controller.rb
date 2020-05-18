class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  
  def show
    if @user.id == current_user.id
      @levelsetting = LevelSetting.find_by(level: @user.level + 1)
      @lowerLevel = LevelSetting.find_by(level: @user.level)
      @reqnextexp = @levelsetting.threshold - @lowerLevel.threshold
      @reqexp = @levelsetting.threshold - @user.exp_point
      @req_percent = (@reqnextexp - @reqexp).fdiv(@reqnextexp) * 100
    else 
      redirect_to user_path(current_user.id)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
