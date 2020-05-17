class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @levelsetting = LevelSetting.find_by(level: @user.level + 1)
    @lowerLevel = LevelSetting.find_by(level: @user.level)
    @reqnextexp = @levelsetting.threshold - @lowerLevel.threshold
    @reqexp = @levelsetting.threshold - @user.exp_point
    @req_percent = (@reqnextexp - @reqexp).fdiv(@reqnextexp) * 100
  end
end
