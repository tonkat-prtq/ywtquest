class LogsController < ApplicationController
  def index
    @logs = Log.all
  end
  
  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    @log.save
  end

  private

  def log_params
    params.require(:log).permit(:started_on, :ended_on)
  end
end