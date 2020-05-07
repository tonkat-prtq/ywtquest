class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
    dones = @log.dones.build
    knowledges = @log.knowledges.build
  end

  def create
    @log = Log.create(log_params)
  end

  private

  def log_params
    params.require(:log).permit(:started_on, :ended_on, 
      dones_attributes: [:title, :comment, :worktime],
      knowledges_attributes: [:title, :comment],
      todos_attributes: [:titile, :comment, :when_to_do]
    )
  end
end