class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @levelsetting = LevelSetting.find_by(level: @user.level + 1)
    @lowerLevel = LevelSetting.find_by(level: @user.level)
    @reqexp = @levelsetting.threshold - @user.exp_point
    @req_percent = @user.exp_point.fdiv(@levelsetting.threshold) * 100
  end
end
