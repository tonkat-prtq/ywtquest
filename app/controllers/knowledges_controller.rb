class KnowledgesController < ApplicationController
  before_action :authenticate_user!
  PER = 10
  
  def index
    @logs = current_user.logs

    if params[:tag_name]
      @logs = current_user.logs.tagged_with("#{params[:tag_name]}")
    else
      @logs = current_user.logs.all
    end
  
    @logs = @logs.page(params[:page]).per(PER).default_order
  end
end
