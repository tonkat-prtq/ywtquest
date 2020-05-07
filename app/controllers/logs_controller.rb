class LogsController < ApplicationController
  before_action :set_log, only: [:edit, :update, :show, :destroy]
  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
    @dones = @log.dones.build
    @knowledges = @log.knowledges.build
    @todos = @log.todos.build
  end

  def create
    @log = Log.create(log_params)
    redirect_to logs_path
  end

  def show
  end

  def edit
    # if current_user.id == @log.user.id あとでつける
  end

  def update
    if params[:back]
      render :edit
    else
      if @log.update(log_params)
        redirect_to logs_path, flash: {success: "YWTを編集しました"}
      else
        render :edit
      end
    end
  end

  def confirm
    binding.pry
    @log = Log.new(log_params)
    @log.id = params[:id]
  end


  private

  def log_params
    params.require(:log).permit(:id, :started_on, :ended_on, 
      dones_attributes: [:title, :comment, :worktime, :logs_id],
      knowledges_attributes: [:title, :comment, :logs_id],
      todos_attributes: [:title, :when_to_do, :logs_id]
    )
  end

  def set_log
    @log = Log.find(params[:id])
  end
end