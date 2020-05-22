class KnowledgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @logs = current_user.logs
  end
end
