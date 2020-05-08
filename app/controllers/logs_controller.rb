class LogsController < ApplicationController
  before_action :set_log, only: [:edit, :update, :show, :destroy]
  def index
    @logs = Log.all
  end

  def new
    if params[:back]
      @log = current_user.logs.build(log_params)
      render :new
    else
      @log = Log.new # current_user.logs.build(log_params)からこう変更して変なパラメーターが渡っちゃうエラー解決
      @dones = @log.dones.build
      @knowledges = @log.knowledges.build
      @todos = @log.todos.build
    end
  end

  def create
    @log = current_user.logs.build(log_params)
    if params[:back]
      render 'new'
    else
      if @log.save
        redirect_to logs_path, flash: {success: "YWTを作成しました"}
        # PostMailer.post_mail(current_user.email).deliver
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
    redirect_to logs_path, flash: {danger: "自分の記事以外の編集はできません"} unless current_user.id == @log.user.id
    binding.pry
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
    @log = current_user.logs.build(log_params)
    @log.id = params[:id]
  end

  def destroy
    if current_user.id == @log.user.id
      @log.destroy
      redirect_to logs_path, flash: {success: "YWTを削除しました"}
    else
      redirect_to logs_path, flash: {danger: "不正な操作です"}
    end
  end


  private

  def log_params
    params.require(:log).permit(:id, :started_on, :ended_on, :user_id,
      dones_attributes: [:id, :title, :comment, :worktime, :logs_id],
      knowledges_attributes: [:id, :title, :comment, :logs_id],
      todos_attributes: [:id, :title, :when_to_do, :logs_id]
    )
  end

  def set_log
    @log = Log.find(params[:id])
  end
end