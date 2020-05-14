class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @levelsetting = LevelSetting.find_by(level: @user.level + 1)
  end
end
