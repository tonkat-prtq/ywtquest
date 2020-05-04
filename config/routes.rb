Rails.application.routes.draw do
  root :to => 'oauth_test#index' # localhost:3000にアクセスした時に描画するViewとコントローラの指定
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks" # google認証された時のcallback URL
  }
end
