class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @levelsetting = LevelSetting.find_by(level: @user.level + 1)
    @lowerLevel = LevelSetting.find_by(level: @user.level)
    @reqexp = @levelsetting.threshold - @user.exp_point
    @req_percent = ((@reqexp).fdiv(@levelsetting.threshold - @lowerLevel.threshold) * 100) - 100
  end
end
