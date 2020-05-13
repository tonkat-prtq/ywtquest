class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  def configure_permitted_parameters
    added_attrs = [:name, :profile]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def levelup
    user = current_user
    log = Log.find(params[:log_id])
    
    point = log.dones.worktime
    # とりあえずworktimeの時間をそのままポイントとする

    totalExp = user.exp_point
    #変数に現在のユーザーの経験値を入れる
    totalExp += point
    # 得られた経験値をユーザーの経験値に加算
  
    user.exp_point = totalExp
    #改めて、加算した経験値をuserの総経験値を示す変数に入れ直す
    user.update(exp_point: totalExp)
    #更新の処理をさせる
  
    levelSetting = LevelSetting.find_by(level: user.level + 1);
  
    while levelSetting.threshold <= user.exp_point # 複数レベルのアップも考慮してwhileでループさせる
      user.level = user.level + 1
      user.update(level: user.level)
      levelSetting = LevelSetting.find_by(level: user.level + 1) # levelSettingをもう一度更新
    end
    
  end
end
