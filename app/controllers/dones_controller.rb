class DonesController < ApplicationController
  before_action :authenticate_user!

  def show
    @dones = current_user.dones
  end
end
